import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/constants.dart';
import 'package:flutter_application_1/controller/bottomnavigation_controler.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/bottomNavigation.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  @override
  State<StatefulWidget> createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
  GlobalKey globalKey = GlobalKey();
  final BottomNavigationController navigationController =
      Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstants.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                Assets.image.applogo.path,
                scale: .75,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Saturn QR",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.whiteColor),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width / 1.3,
                child: const Text(
                  "Saturn Qr is a mobile application that has been developed with Flutter technology. In this application, it is possible to create a qr code and also scan a qr code. ",
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(fontSize: 20, color: AppConstants.whiteColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: size.width / 1.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Developer:",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppConstants.primareyColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Amirreza Jolous Haqi",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: AppConstants.whiteColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              myLaunchUrl(String url) async {
                                var uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }

                              myLaunchUrl("https://instagram.com/amirrezahaqi");
                            },
                            icon: SvgPicture.asset(Assets.icon.instagram)),
                        IconButton(
                            onPressed: () {
                              myLaunchUrl(String url) async {
                                var uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }

                              myLaunchUrl(
                                  "https://www.linkedin.com/in/amirreza-haqi/");
                            },
                            icon: SvgPicture.asset(Assets.icon.linkedin)),
                        IconButton(
                            onPressed: () {
                              myLaunchUrl(String url) async {
                                var uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }

                              myLaunchUrl("https://twitter.com/amirrezahaqi");
                            },
                            icon: SvgPicture.asset(Assets.icon.twitter)),
                        IconButton(
                            onPressed: () {
                              myLaunchUrl(String url) async {
                                var uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }

                              myLaunchUrl("https://github.com/amirrezahaqi");
                            },
                            icon: SvgPicture.asset(Assets.icon.github)),
                        IconButton(
                            onPressed: () {
                              myLaunchUrl(String url) async {
                                var uri = Uri.parse(url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                }
                              }

                              myLaunchUrl("https://amirrezahaqi.ir");
                            },
                            icon: SvgPicture.asset(Assets.icon.website)),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset(
                        Assets.image.logotext.path,
                        scale: 1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
