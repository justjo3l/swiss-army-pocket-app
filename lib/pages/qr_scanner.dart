// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreenState createState() => QrScannerScreenState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            child: buildResult(),
            bottom: 20,
          )
        ],
      ),
    );
  }

  Widget buildResult() => Container(
        child: Text(barcode != null ? 'Result: ${barcode!.code}' : 'Scan a Code!',
            maxLines: 3,
            style: TextStyle(
              color: Theme.of(context).primaryTextTheme.headline6!.color,
            )),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(
          10,
        ),
      );

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
      (barcode) => setState(() => this.barcode = barcode),
    );
  }
}
