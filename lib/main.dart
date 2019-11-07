import 'package:flutter/material.dart';
import 'package:openote/pages/editor_page.dart';
import 'package:openote/pages/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditorPage()
    );
  }
}