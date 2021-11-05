import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:swiss_army_pocket_app/pages/qr_result.dart';

import 'qr_result.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  QrScannerScreenState createState() => QrScannerScreenState();

  static QrScannerScreenState of(BuildContext context) => context.findAncestorStateOfType<QrScannerScreenState>() as QrScannerScreenState;
}

class QrScannerScreenState extends State<QrScannerScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void resetCamera() async {
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
        ],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 5,
          borderRadius: 20,
          borderLength: 40,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen(
      (barcode) {
        controller.stopCamera();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QrResultScreen(qrCodeResult: barcode.code),
          ),
        );
      },
    );
  }
}
