import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;
  final List<int> history = [];

  // page index
  final int homeIndex = 0;
  final int aboutUsIndex = 1;
  final int shareIndex = 2;

  //page Keys
  GlobalKey<NavigatorState> homeKey = GlobalKey();
  GlobalKey<NavigatorState> aboutUsKey = GlobalKey();
  GlobalKey<NavigatorState> shareKey = GlobalKey();

  Map<int, GlobalKey<NavigatorState>> get navigationMap => {
        homeIndex: homeKey,
        aboutUsIndex: aboutUsKey,
        shareIndex: shareKey,
      };

  Future<bool> willPop() async {
    final currentNavigationTapState =
        navigationMap[currentIndex.value]!.currentState!;
    if (currentNavigationTapState.canPop()) {
      currentNavigationTapState.pop();
      return false;
    } else if (history.isNotEmpty) {
      currentIndex.value = history.last;
      history.removeLast();
      return false;
    }
    return true;
  }
}
