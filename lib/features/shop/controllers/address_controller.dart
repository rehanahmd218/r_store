import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:r_store/data/repositories/address/address_repository.dart';
import 'package:r_store/data/repositories/authentication/authentication_repository.dart';
import 'package:r_store/features/shop/models/address_mode.dart';
import 'package:r_store/features/shop/screens/addresses/widgets/address_card.dart';
import 'package:r_store/utils/constants/sizes.dart';
import 'package:r_store/utils/helpers/cloud_helper_functions.dart';
import 'package:r_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.isRegistered<AddressController>()
      ? Get.find<AddressController>()
      : Get.put(AddressController());

  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  Rx<TextEditingController> street = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> state = TextEditingController().obs;
  Rx<TextEditingController> postalCode = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;

  Rx<GlobalKey<FormState>> addressFormKey = GlobalKey<FormState>().obs;

  RxList<AddressModel> addressList = <AddressModel>[].obs;
  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  final AddressRepository _addressRepo = Get.put(AddressRepository());

  Future<void> addSingleAddress() async {
    try {
      if (!addressFormKey.value.currentState!.validate()) {
        return;
      }
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      AddressModel address = AddressModel(
        id: '',
        name: name.value.text,
        phoneNumber: phoneNumber.value.text,
        street: street.value.text,
        city: city.value.text,
        state: state.value.text,
        postalCode: postalCode.value.text,
        country: country.value.text,
        selectedAddress: true,
      );
      if (userId.isEmpty) {
        throw Exception("User not authenticated");
      }

      addressList.add(address);
      final addressID = await _addressRepo.addSingleAddress(userId, address);
      await _addressRepo.updateSingleAddressField(
        userId,
        addressID,
        selectedAddress.value.id,
      );
      address.id = addressID;
      selectedAddress.value = address;
      RLoaders.successSnackBar(
        title: "Success",
        message: "Address added successfully",
      );
      clearControllers();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      print("Error adding address: $e");
    }
  }

  void clearControllers() {
    name.value.clear();
    phoneNumber.value.clear();
    street.value.clear();
    city.value.clear();
    state.value.clear();
    postalCode.value.clear();
    country.value.clear();
  }

  Future<List<AddressModel>> fetchAllAddresses() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      if (userId.isEmpty) {
        throw Exception("User not authenticated");
      }
      List<AddressModel> addresses = await _addressRepo.getAllAddresses(userId);
      addressList.assignAll(addresses);
      if (addresses.isNotEmpty) {
        selectedAddress.value = addresses.firstWhere(
          (address) => address.selectedAddress == true,
          orElse: () => addresses[0],
        );
      }
      return addresses;
    } catch (e) {
      print("Error fetching addresses: $e");
      return [];
    }
  }

  void selectAddress(AddressModel address) async {
    try {
      await _addressRepo.updateSingleAddressField(
        FirebaseAuth.instance.currentUser?.uid ?? '',
        address.id,

        selectedAddress.value.id,
      );
    } catch (e) {
      print("Error updating address: $e");
    }
    // Doing old Address as False
    selectedAddress.value.selectedAddress = false;


    selectedAddress.value = address;
    selectedAddress.value.selectedAddress = true;

    addressList.refresh();
    selectedAddress.refresh();
    // Optionally, save the selected address to local storage
  }

  void changeAddressPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(RSizes.defaultSpace),
            child: FutureBuilder(
              future: fetchAllAddresses(),
              builder: (context, asyncSnapshot) {
                final widget = RCloudHelperFunctions.checkMultiRecordState(
                  snapshot: asyncSnapshot,
                );
                if (widget != null) {
                  return widget;
                }
                final data = asyncSnapshot.data as List<AddressModel>;
                if (data.isEmpty) {
                  return Column(children: [Text("No addresses found")]);
                }
                return Column(
                  spacing: RSizes.spaceBtwItems,
                  children: data.map((address) {
                    return Obx(() {
                      final isSelected = address.id == selectedAddress.value.id;
                      return RAddressCard(address: address);
                      
                    });
                  }).toList(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
