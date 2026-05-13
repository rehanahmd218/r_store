import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:r_store/bindings/general_bindings.dart';
import 'package:r_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:r_store/features/shop/screens/routes/app_routes.dart';
import 'package:r_store/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      getPages: AppRoutes.pages,
      themeMode: ThemeMode.system, // Use system theme mode
      home: const OnBoardingScreen(),
      
    );
  }
}