// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:async';

import 'pages/home.dart';
import 'data/theme.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiss Army Pocket App',
      home: Home(),
      theme: AppTheme.getAppTheme(),
    );
  }
}

Future<void> main() async => runApp(MainApp());
