import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dart_code_viewer/dart_code_viewer.dart';
import 'package:mustache_template/mustache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode _themeMode;
  late IconData iconToggle;

  initState() {
    super.initState();
    _themeMode = ThemeMode.system;
    iconToggle = Icons.toggle_on;
  }

  toggleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
      iconToggle = Icons.toggle_off;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
      iconToggle = Icons.toggle_on;
    } else {
      if (Brightness.light == Theme.of(context).brightness) {
        _themeMode = ThemeMode.dark;
        iconToggle = Icons.toggle_off;
      } else {
        _themeMode = ThemeMode.light;
        iconToggle = Icons.toggle_on;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final template = File('../../lib/src/dart_code_viewer.dart').readAsStringSync();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dart Code Viewer Example'),
          actions: [
            IconButton(
              icon: Icon(iconToggle),
              onPressed: () {
                setState(() {
                  toggleThemeMode();
                });
              },
            ),
          ],
        ),
        body: DartCodeViewer(template),
      ),
    );
  }
}
