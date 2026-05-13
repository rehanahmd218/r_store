import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:r_store/bindings/general_bindings.dart';
import 'package:r_store/utils/popups/loaders.dart';
import 'package:r_store/utils/theme/theme.dart';

class TestingThingsScreen extends StatelessWidget {
  const TestingThingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Use system theme mode
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              ElevatedButton(
                
                onPressed: () {
                  RLoaders.warningSnackBar(
                    title: 'Warning',
                    message: 'This is a warning message',
                  );
                },
                child: Text('Warning SnackBar'),
              ),
              ElevatedButton(
                onPressed: () {
                  RLoaders.successSnackBar(
                    title: 'Success',
                    message: 'This is a success message',
                  );
                },
                child: Text('Success SnackBar'),
              ),
              ElevatedButton(
                onPressed: () {
                  RLoaders.errorSnackBar(
                    title: 'Error',
                    message: 'This is an error message',
                  );
                },
                child: Text('Error SnackBar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
