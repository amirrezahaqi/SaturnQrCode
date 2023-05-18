import 'package:flutter/material.dart';

import 'package:flutter_application_1/scanqrcode.dart';
import 'package:flutter_application_1/splash.dart';

void main() => runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const QRViewExample(),
            ));
          },
          child: const Text('qrView'),
        ),
      ),
    );
  }
}
