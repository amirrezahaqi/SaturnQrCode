import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/qr-code-generator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GenerateScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.darkbackground,
      body: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Assets.image.applogo.image(scale: 0.75),
            const SizedBox(
              height: 20,
            ),
            const SpinKitDancingSquare(
              color: AppConstants.primareyColor,
              size: 50,
            ),
          ]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Center(
              child: Image.asset(Assets.image.logotext.path, height: 30),
            ),
          )
        ],
      ),
    );
  }
}
