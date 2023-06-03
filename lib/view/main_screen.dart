import 'package:flutter/material.dart';
import 'package:saturn_qr/view/about_screen.dart';
import 'package:saturn_qr/view/widgets/bottomNavigation.dart';
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
            bottomNavigationBar: AppBottomNavigation(
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
