import 'package:flutter_application_1/controller/bottomnavigation_controler.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // bottom navigation controller
    Get.put<BottomNavigationController>(BottomNavigationController());
  }
}
