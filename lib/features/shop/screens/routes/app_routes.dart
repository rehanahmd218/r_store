import 'package:get/get.dart';
import 'package:r_store/features/authentication/screens/login/login.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:r_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:r_store/features/authentication/screens/signup/signup_screen.dart';
import 'package:r_store/features/personalizations/screens/settings/settings.dart';
import 'package:r_store/features/shop/models/product_model.dart';
import 'package:r_store/features/shop/screens/addresses/user_address_screen.dart';
import 'package:r_store/features/shop/screens/all_products/all_products.dart';
import 'package:r_store/features/shop/screens/brand/all_brands.dart';
import 'package:r_store/features/shop/screens/cart/cart_screen.dart';
import 'package:r_store/features/shop/screens/checkout/checkout_screen.dart';
import 'package:r_store/features/shop/screens/home/home_screen.dart';
import 'package:r_store/features/shop/screens/orders/orders_screen.dart';
import 'package:r_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:r_store/features/shop/screens/profile/profile_screen.dart';
import 'package:r_store/features/shop/screens/reviews/reviews_screen.dart';
import 'package:r_store/features/shop/screens/routes/routes.dart';
import 'package:r_store/features/shop/screens/store/store_screen.dart';
import 'package:r_store/features/shop/screens/subcategory/sub_categories_screen.dart';
import 'package:r_store/features/shop/screens/wishlist/wishlist_screen.dart';

class AppRoutes{

  static final pages = [
    GetPage(name: RRoutes.home, page: () => const HomeScreen()),
  GetPage(name: RRoutes.store, page: () => const StoreScreen()),
  GetPage(name: RRoutes.favourites, page: () => const WishlistScreen()),
  GetPage(name: RRoutes.settings, page: () => const SettingsScreen()),
  // GetPage(name: RRoutes.subCategories, page: () => const SubCategoriesScreen()),
  GetPage(name: RRoutes.productReviews, page: () => const ProductReviewsScreen()),
  GetPage(name: RRoutes.productDetail, page: () =>  ProductDetailsScreen(
    product: ProductModel.empty(),
  )),
  GetPage(name: RRoutes.order, page: () => const OrdersScreen()),
  GetPage(name: RRoutes.checkout, page: () => const CheckoutScreen()),
  GetPage(name: RRoutes.cart, page: () => const CartScreen()),
  GetPage(name: RRoutes.brand, page: () => const AllBrandsScreen()),
  // GetPage(name: RRoutes.allProducts, page: () => const AllProductsScreen()),
  GetPage(name: RRoutes.userProfile, page: () => const ProfileScreen()),
  GetPage(name: RRoutes.userAddress, page: () => const UserAddressScreen()),
  GetPage(name: RRoutes.signup, page: () => const SignupScreen()),
  GetPage(name: RRoutes.signIn, page: () => const LoginScreen()),
  GetPage(name: RRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
  GetPage(name: RRoutes.onBoarding, page: () => const OnBoardingScreen()),
  
  ];

}