import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:r_store/common/prefferd_sized/appbar.dart';
import 'package:r_store/common/widgets/list_tiles/setting_menu_title.dart';
import 'package:r_store/data/r_dummy_data.dart';
import 'package:r_store/data/repositories/dataUploading/dummy_data_upload.dart';
import 'package:r_store/utils/constants/sizes.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DummyDataUpload());
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              RSettingMenuTile(
                leadingIcon: Iconsax.document_upload,
                title: 'Upload Categories',
                subtitle: 'Upload categories to your cloud firebase',
                onTap: () {
                  controller.uploadCategoriesData();
                },
              ),
              RSettingMenuTile(
                leadingIcon: Iconsax.document_upload,
                title: 'Upload Banners',
                subtitle: 'Upload banners to your cloud firebase',
                onTap: () {
                  controller.uploadBannersData();
                },
              ),
              RSettingMenuTile(
                leadingIcon: Iconsax.document_upload,
                title: 'Upload Products',
                subtitle: 'Upload products to your cloud firebase',
                onTap: () {
                  controller.uploadProductsData();
                },
              ),
              RSettingMenuTile(
                leadingIcon: Iconsax.document_upload,
                title: 'Upload Brands',
                subtitle: 'Upload brands to your cloud firebase',
                onTap: () {
                  controller.uploadDummyData(
                    collectionName: 'rehan_brands',
                    dummyData: RDummyData.brands,
                    firebaseImgPath: 'Rehan_Pictures/Brands',
                    imgField: 'image',
                  );
                },
              ),
              RSettingMenuTile(
                leadingIcon: Iconsax.document_upload,
                title: 'Upload Brand Categories',
                subtitle: 'Upload brand categories to your cloud firebase',
                onTap: () {
                  controller.uploadDummyBrandCategories();
                },
              ),
              RSettingMenuTile(
                leadingIcon: Iconsax.document_upload,
                title: 'Upload Product Categories',
                subtitle: 'Upload product categories to your cloud firebase',
                onTap: () {
                  controller.uploadDummyProductCategories();
                },
              ),
              // RSettingMenuTile(
              //   leadingIcon: Iconsax.document_upload,
              //   title: 'Upload Addresses',
              //   subtitle: 'Upload addresses to your cloud firebase',
              //   onTap: () {
              //     controller.uploadDummyAddresses();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
