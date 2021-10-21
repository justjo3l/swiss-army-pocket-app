// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/data/note.dart';
import 'dart:async';

import 'pages/home.dart';
import 'data/theme.dart';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/note.dart';

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

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());

  runApp(MainApp());
}
