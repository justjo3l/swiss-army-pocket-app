// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, library_prefixes, annotate_overrides

import 'package:flutter/material.dart';
import 'package:swiss_army_pocket_app/data/note.dart';
import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart' as pathProvider;

import 'pages/home.dart';
import 'data/theme.dart';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/note.dart';

class MainApp extends StatefulWidget {
  MainAppState createState() => MainAppState();

  static MainAppState of(BuildContext context) => context.findAncestorStateOfType<MainAppState>() as MainAppState;
}

class MainAppState extends State<MainApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swiss Army Pocket App',
      home: Home(),
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: _themeMode,
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await pathProvider.getApplicationDocumentsDirectory();

  await Hive.initFlutter(directory.path);

  Hive.registerAdapter(NoteAdapter());

  runApp(MainApp());
}
