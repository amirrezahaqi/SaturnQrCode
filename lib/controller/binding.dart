import 'package:saturn_qr/controller/bottomnavigation_controler.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // bottom navigation controller
    Get.put<BottomNavigationController>(BottomNavigationController());
  }
}
