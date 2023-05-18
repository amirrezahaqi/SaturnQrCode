// ignore: file_names
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/scanqrcode.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({super.key});
  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {
  GlobalKey globalKey = GlobalKey();
  String _dataString = "Hello from this QR";
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstants.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.image.logo.image(),
                const SizedBox(
                  width: 10,
                ),
                const Text(AppConstants.saturnQr)
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: size.width / 1.25,
                height: size.width / 1.1,
                decoration: BoxDecoration(
                    color: AppConstants.secondColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    children: [
                      Container(
                        width: size.width / 1.25,
                        height: size.width / 1.4,
                        decoration: BoxDecoration(
                            color: AppConstants.whiteColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: QrImage(
                          data: _dataString,
                          size: size.width / 1.5,
                          errorStateBuilder: (cxt, err) {
                            return const Center(
                              child: Text(
                                "error",
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            void saveQrCode() async {
                              // گرفتن تصویر qr code از ویجت QrImage
                              final qrImage = await QrPainter(
                                color: AppConstants.whiteColor,
                                data: _dataString,
                                version: QrVersions.auto,
                                errorCorrectionLevel: QrErrorCorrectLevel.L,
                              ).toImage(200);

                              // تبدیل تصویر به بایت
                              final byteData = await qrImage.toByteData(
                                  format: ImageByteFormat.png);
                              if (byteData != null) {
                                final bytes = byteData.buffer.asUint8List();

                                // ذخیره تصویر در گالری
                                final result =
                                    await ImageGallerySaver.saveImage(
                                  Uint8List.fromList(bytes),
                                );
                                print(result);
                              }
                            }

                            saveQrCode();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.icon.download,
                                width: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppConstants.saveToGallery,
                                style: GoogleFonts.vazirmatn(
                                  color: AppConstants.whiteColor,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: size.height / 3,
                width: size.width / 1.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: size.height / 15,
                      width: size.width / 1.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppConstants.whiteColor),
                          color: AppConstants.secondColor),
                      child: Center(
                        child: TextField(
                          style:
                              const TextStyle(color: AppConstants.whiteColor),
                          controller: _textController,
                          decoration: InputDecoration(
                            filled: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Enter Your Links Or Texts",
                            icon: GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(Assets.icon.paste),
                              ),
                            ),
                            hintStyle: GoogleFonts.vazirmatn(
                                color: AppConstants.whiteColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: size.width / 1.25,
                      decoration: BoxDecoration(
                          color: AppConstants.primareyColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              _dataString = _textController.text;
                            });
                          },
                          child: Text(
                            "Create Qr Code",
                            style: GoogleFonts.vazirmatn(
                              color: AppConstants.whiteColor,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: size.width / 1.25,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: AppConstants.darkbackground,
                          borderRadius: BorderRadius.circular(50)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const QRViewExample(),
                            ));
                          },
                          child: Text(
                            "Scan Your Qr Code",
                            style: GoogleFonts.vazirmatn(
                              color: AppConstants.whiteColor,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                onTap: () {},
                isActive: true,
              ),
              BottomNavItem(
                imagePath: 'assets/icon/star.svg',
                lable: AppConstants.rateus,
                onTap: () {},
              ),
              BottomNavItem(
                imagePath: 'assets/icon/users.svg',
                lable: AppConstants.aboutus,
                onTap: () {},
              ),
              BottomNavItem(
                imagePath: 'assets/icon/share.svg',
                lable: AppConstants.shareApp,
                onTap: () {},
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
