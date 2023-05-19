import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/about_screen.dart';
import 'package:flutter_application_1/view/widgets/bottomNavigation.dart';
import 'package:get/get.dart';

import '../controller/bottomnavigation_controler.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final BottomNavigationController navigationController =
        Get.find<BottomNavigationController>();
    return Obx(
      () {
        return Scaffold(
            bottomNavigationBar: LinkeryBottomNavigation(
              onTapChange: (index) {
                navigationController.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: navigationController.currentIndex.value,
              children: const [
                HomeScreen(),
                AboutScreen(),
              ],
            ));
      },
    );
  }
}
