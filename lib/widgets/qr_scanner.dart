import 'dart:developer';
import 'dart:io';

import 'package:customstuff/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CustomQRScanner extends StatefulWidget {
  final String title;
  final Widget topImageSection;
  final Color? pColor1, pColor2, primaryColor;

  final Function(QRViewController) onScan;

  const CustomQRScanner({
    Key? key,
    required this.title,
    required this.topImageSection,
    required this.onScan,
    this.pColor1,
    this.pColor2,
    this.primaryColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CustomQRScannerState();
  }
}

class CustomQRScannerState extends State<CustomQRScanner>
    with SingleTickerProviderStateMixin {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late AnimationController _animationController;
  bool _animationStopped = false;
  String scanText = "Scan";
  bool scanning = false;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    getScannerAnimation();
    super.initState();
  }

  getScannerAnimation() async {
    if (!scanning) {
      animateScanAnimation(false);
      setState(() {
        _animationStopped = false;
        scanning = true;
      });
    } else {
      setState(() {
        _animationStopped = true;
        scanning = false;
      });
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        /// QR Scanner
        buildQrView(context),

        /// Start =================================  Data Details Section
        SizedBox(
          height: 700,
          child: Stack(alignment: Alignment.center, children: [
            SizedBox(
              height: 400.0,
              child: Stack(alignment: Alignment.center, children: [
                Stack(alignment: Alignment.center, children: [
                  const SizedBox(height: 200.0, width: 200.0),
                  QRScannerAnimation(
                    stopped: _animationStopped,
                    width: 198,
                    animation: _animationController,
                    pColor1: widget.pColor1,
                    pColor2: widget.pColor2,
                  ),
                ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Scan QR",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Please align the QR within the frame",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: widget.topImageSection,
                  // child: imageSection,
                ),
              ]),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade50),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ]),
        ),

        /// End =================================  Data Details Section

        /// Close QR Button
        SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget buildQrView(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var scanArea = (width < 400 || height < 400) ? 200.0 : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: widget.onScan,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 5,
        borderLength: 50,
        borderWidth: 5,
        overlayColor: widget.primaryColor ?? CustomColor.primaryColor.withOpacity(0.8),
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  // void _onQRViewCreated(QRViewController controller) {
  //   setState(() {
  //     this.controller = controller;
  //   });
  //   int count = 0;
  //   controller.scannedDataStream.listen((scanData) {
  //     result = scanData;
  //     count++;
  //     if (result!.code != null && count == 1) {
  //       debugPrint("\n\n\n\nValue : ${result!.code}");
  //     }
  //   });
  // }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class QRScannerAnimation extends AnimatedWidget {
  final bool stopped;
  final double width;
  final Color? pColor1, pColor2;

  const QRScannerAnimation({
    Key? key,
    required Animation<double> animation,
    required this.stopped,
    required this.width,
    this.pColor1,
    this.pColor2,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    final scorePosition = (animation.value * 300);

    Color color1 = pColor1 ?? CustomColor.primaryColor.withOpacity(0.5);
    Color color2 = pColor2 ?? CustomColor.primaryColor.withOpacity(0.01);

    if (animation.status == AnimationStatus.reverse) {
      color1 = pColor2 ?? CustomColor.primaryColor.withOpacity(0.01);
      color2 = pColor1 ?? CustomColor.primaryColor.withOpacity(0.5);
    }

    return Positioned(
      bottom: scorePosition,
      child: Opacity(
        opacity: (stopped) ? 0.0 : 1.0,
        child: Container(
          height: 30.0,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
}
