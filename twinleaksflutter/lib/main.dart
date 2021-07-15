import 'package:flutter/material.dart';
import 'package:twinleaksflutter/pages/home_page.dart';
import 'package:twinleaksflutter/styles/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool isDev = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: TwinLeaksTheme.getTheme(false),
      home: HomePage(),
    );
  }
}
