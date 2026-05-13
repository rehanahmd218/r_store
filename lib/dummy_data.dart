import 'package:r_store/features/shop/models/product_category_model.dart';

import '../../../routes/routes.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../personalization/models/address_model.dart';
import '../../personalization/models/user_model.dart';
import '../models/banner_model.dart';
import '../models/brand_category_model.dart';
import '../models/brand_model.dart';
import '../models/cart_item_model.dart';
import '../models/cart_model.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/product_attribute_model.dart';
import '../models/product_category_model.dart';
import '../models/product_model.dart';
import '../models/product_review_model.dart';
import '../models/product_variation_model.dart';

class TDummyData {
  /// -- Banners
  /// -- User
  static final UserModel user = UserModel(
    firstName: 'Coding',
    lastName: 'with T',
    email: 'support@codingwithT.com',
    phoneNumber: '+14155552671',
    profilePicture: TImages.user,
    addresses: [
      AddressModel(
        id: '1',
        name: 'Coding with T',
        phoneNumber: '+923178059528',
        street: '82356 Timmy Coves',
        city: 'South Liana',
        state: 'Maine',
        postalCode: '87665',
        country: 'USA',
      ),
      AddressModel(
        id: '6',
        name: 'John Doe',
        phoneNumber: '+1234567890',
        street: '123 Main Street',
        city: 'New York',
        state: 'New York',
        postalCode: '10001',
        country: 'United States',
      ),
      AddressModel(
        id: '2',
        name: 'Alice Smith',
        phoneNumber: '+9876543210',
        street: '456 Elm Avenue',
        city: 'Los Angeles',
        state: 'California',
        postalCode: '90001',
        country: 'United States',
      ),
      AddressModel(
        id: '3',
        name: 'Taimoor Sikander',
        phoneNumber: '+923178059528',
        street: 'Street 35',
        city: 'Islamabad',
        state: 'Federal',
        postalCode: '48000',
        country: 'Pakistan',
      ),
      AddressModel(
        id: '4',
        name: 'Maria Garcia',
        phoneNumber: '+5412345678',
        street: '789 Oak Road',
        city: 'Buenos Aires',
        state: 'Buenos Aires',
        postalCode: '1001',
        country: 'Argentina',
      ),
      AddressModel(
        id: '5',
        name: 'Liam Johnson',
        phoneNumber: '+447890123456',
        street: '10 Park Lane',
        city: 'London',
        state: 'England',
        postalCode: 'SW1A 1AA',
        country: 'United Kingdom',
      ),
    ],
    username: '',
    id: '',
  );

  /// -- Cart
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId: '001',
        variationId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
        productId: '002',
        variationId: '',
        quantity: 1,
        title: products[1].title,
        image: products[1].thumbnail,
        brandName: products[1].brand!.name,
        price: products[1].price,
        selectedVariation: products[1].productVariations != null
            ? products[1].productVariations![1].attributeValues
            : {},
      ),
    ],
  );

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      items: cart.items,
      totalAmount: 265,
      orderDate: DateTime(2023, 09, 1),
      deliveryDate: DateTime(2023, 09, 9),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      items: cart.items,
      totalAmount: 369,
      orderDate: DateTime(2023, 10, 2),
      deliveryDate: DateTime(2023, 10, 6),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      items: cart.items,
      totalAmount: 254,
      orderDate: DateTime(2023, 11, 3),
      deliveryDate: DateTime(2023, 11, 8),
    ),
    OrderModel(
      id: 'CWT0265',
      status: OrderStatus.delivered,
      items: cart.items,
      totalAmount: 355,
      orderDate: DateTime(2023, 12, 20),
      deliveryDate: DateTime(2023, 12, 25),
    ),
    OrderModel(
      id: 'CWT1536',
      status: OrderStatus.delivered,
      items: cart.items,
      totalAmount: 115,
      orderDate: DateTime(2023, 12, 25),
      deliveryDate: DateTime(2024, 01, 1),
    ),
  ];



  /// -- Sorting Filters for search
  static final sortingFilters = [
    SortFilterModel(id: '1', name: 'Name'),
    SortFilterModel(id: '2', name: 'Lowest Price'),
    SortFilterModel(id: '3', name: 'Most Popular'),
    SortFilterModel(id: '4', name: 'Highest Price'),
    SortFilterModel(id: '5', name: 'Newest'),
    SortFilterModel(id: '6', name: 'Most Suitable'),
  ];

  /// -- Product Reviews
  static final List<ProductReviewModel> productReviews = [
    ProductReviewModel(
      id: '01',
      userId: '001',
      userName: 'John Doe',
      rating: 4.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage2,
      comment:
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
      companyComment:
          'Thank you for your kind words, John! We are delighted to hear about your smooth experience with the app. We always strive to offer an intuitive interface for our users. Stay tuned for more updates!',
    ),
    ProductReviewModel(
      id: '02',
      userId: '002',
      userName: 'Sophia Wilson',
      rating: 3.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage1,
      comment:
          'I am genuinely impressed with the app design and the variety of products available. The filter and sort features have made shopping so much easier for me!',
      companyComment:
          'Thank you so much, Sophia! We are thrilled to hear you are enjoying the app and finding the features useful. Our goal is to make your shopping experience as efficient and pleasant as possible. Keep exploring, and happy shopping!',
    ),
    ProductReviewModel(
      id: '03',
      userId: '003',
      userName: 'Alex Brown',
      rating: 5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: TImages.userProfileImage3,
      comment:
          'The app is pretty fast, and the product recommendations are on point! I would love to see more features in the future.',
      companyComment:
          'Thanks for the feedback, Alex! We are thrilled to hear you enjoyed the speed and recommendations. We are constantly working on introducing new features, so keep an eye out for the next update!',
    ),
  ];
}



class SortFilterModel {
  String id;
  String name;

  SortFilterModel({required this.id, required this.name});
}
