import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/about_screen.dart';
import 'package:flutter_application_1/view/home_screen.dart';
import 'package:flutter_application_1/view/main_screen.dart';

import 'package:flutter_application_1/view/scanner_screen.dart';
import 'package:flutter_application_1/view/splash_screen.dart';
import 'package:get/get.dart';

import 'controller/binding.dart';
import 'controller/bottomnavigation_controler.dart';
import 'routes/screens_routes.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);
  final BottomNavigationController navigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      getPages: [
        GetPage(
            name: ScreenRoutes.mainScreenRoute, page: () => const MainScreen()),
        GetPage(
            name: ScreenRoutes.aboutScreenRoute,
            page: () => const AboutScreen()),
      ],
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
