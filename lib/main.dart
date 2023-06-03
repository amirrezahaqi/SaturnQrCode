import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:saturn_qr/view/about_screen.dart';
import 'package:saturn_qr/view/home_screen.dart';
import 'package:saturn_qr/view/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:saturn_qr/view/scanner_screen.dart';
import 'package:saturn_qr/view/splash_screen.dart';
import 'package:get/get.dart';

import 'controller/binding.dart';
import 'controller/bottomnavigation_controler.dart';
import 'routes/screens_routes.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(MyHome());
}

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
