import 'package:flutter/material.dart';

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
    return Scaffold(
      body: () {
        final Size size = MediaQuery.of(context).size;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
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
            ),
            SizedBox(
              height: size.height / 3,
              width: size.width / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _textController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _dataString = _textController.text;
                        });
                      },
                      child: Text("generate"))
                ],
              ),
            ),
          ],
        );
      }(),
    );
  }
}
