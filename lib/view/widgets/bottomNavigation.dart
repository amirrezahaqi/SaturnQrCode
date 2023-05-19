import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constants.dart';
import 'package:flutter_application_1/controller/bottomnavigation_controler.dart';
import 'package:flutter_application_1/view/home_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:share_plus/share_plus.dart';

class LinkeryBottomNavigation extends StatelessWidget {
  const LinkeryBottomNavigation({
    super.key,
    required this.onTapChange,
  });
  final Function(int index) onTapChange;
  @override
  Widget build(BuildContext context) {
    final BottomNavigationController controller =
        Get.find<BottomNavigationController>();
    final Size size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        height: size.height / 10,
        color: AppConstants.secondColor,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                imagePath: 'assets/icon/home.svg',
                lable: AppConstants.home,
                onTap: () => onTapChange(controller.homeIndex),
                isActive: controller.currentIndex.value == 0,
              ),
              BottomNavItem(
                imagePath: 'assets/icon/star.svg',
                lable: AppConstants.rateus,
                onTap: () {},
              ),
              BottomNavItem(
                imagePath: 'assets/icon/users.svg',
                lable: AppConstants.aboutus,
                onTap: () => onTapChange(controller.aboutUsIndex),
                isActive: controller.currentIndex.value == 1,
              ),
              BottomNavItem(
                isActive: controller.currentIndex.value == 2,
                imagePath: 'assets/icon/share.svg',
                lable: AppConstants.shareApp,
                onTap: () {
                  Share.share('check out my website https://amirrezahaqi.ir',
                      subject: 'Saturn QR Code App');
                },
              ),
            ]),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.lable,
    this.lableSpace = 4,
    this.isActive = false,
    this.activeColor = AppConstants.primareyColor,
    this.deactivateColor = AppConstants.whiteColor,
    this.activeLableColor = AppConstants.primareyColor,
  });

  final Function() onTap;
  final String imagePath;
  final String lable;
  final double lableSpace;
  final bool isActive;
  final Color activeColor;
  final Color activeLableColor;
  final Color deactivateColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(imagePath,
              colorFilter: ColorFilter.mode(
                  isActive ? activeColor : deactivateColor, BlendMode.srcIn)),
          const SizedBox(
            height: 15,
          ),
          Text(lable,
              style: GoogleFonts.vazirmatn(
                  color: isActive ? activeLableColor : deactivateColor))
        ],
      ),
    );
  }
}
