// ignore_for_file: unused_import, prefer_const_constructors, unused_local_variable, prefer_const_declarations, prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../widgets/qr_result_app_bar.dart';
import '../widgets/main_navigation_row.dart';

import 'qr_scanner.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'notes.dart';

import 'package:url_launcher/url_launcher.dart';

class QrResultScreen extends StatefulWidget {
  final qrCodeResult;

  const QrResultScreen({Key? key, required String this.qrCodeResult}) : super(key: key);

  @override
  QrResultScreenState createState() => QrResultScreenState(
        qrCodeResult: qrCodeResult,
      );
}

class QrResultScreenState extends State<QrResultScreen> {
  final qrCodeResult;

  QrResultScreenState({
    required this.qrCodeResult,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: QrResultAppBar(
          titleText: 'QR Result',
          titleIcon: Icon(Icons.qr_code_2_sharp),
        ),
        body: Column(
          children: [
            Container(
              child: Uri.parse(qrCodeResult).isAbsolute
                  ? Link(
                      target: LinkTarget.blank,
                      uri: Uri.parse(qrCodeResult),
                      builder: (context, followlink) => GestureDetector(
                        child: Text(
                          qrCodeResult,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onTap: followlink,
                      ),
                    )
                  : SelectableText(
                      qrCodeResult,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              alignment: Alignment.center,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
      onPanUpdate: (gestureDetails) {
        if (gestureDetails.delta.dy > 5) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QrScannerScreen(),
            ),
          );
        }
      },
      onTap: () {
        setState(
          () {
            FocusScope.of(context).unfocus();
          },
        );
      },
    );
  }
}
