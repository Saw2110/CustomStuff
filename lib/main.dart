import 'dart:developer';

import 'package:customstuff/widgets/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'constant/colors.dart';
import 'screen/index_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: CustomColor.primarySwatchColor),
      // home: CustomQRScanner(
      //   title: "Scan",
      //   topImageSection: imageSection,
      //   onScan: (value) {
      //     _onQRViewCreated(value, context);
      //   },
      // ),
      home:CalenderScreen()
    );
  }

  void _onQRViewCreated(QRViewController controller, BuildContext context) {
    int count = 0;
    controller.scannedDataStream.listen((scanData) {
      count++;
      if (scanData.code != null && count == 1) {
       log("\n\n Result Data => ${scanData.code} \n\n");
      }
    });
  }
}

Widget imageSection =
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  Flexible(
    child: CircleAvatar(
      backgroundColor: Colors.grey.shade50,
      radius: 30.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset('images/easySoft.png'),
      ),
    ),
  ),
  Container(
    margin: const EdgeInsets.symmetric(horizontal: 30.0),
    height: 40.0,
    width: 0.4,
    color: Colors.grey.shade50,
  ),
  Flexible(
    child: CircleAvatar(
      backgroundColor: Colors.grey.shade50,
      radius: 30.0,
      child: Image.asset('images/collector_trans.png'),
    ),
  ),
]);
