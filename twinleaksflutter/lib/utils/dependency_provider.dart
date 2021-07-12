import 'package:flutter/material.dart';

class DependencyProvider extends ChangeNotifier {
  String env = "DEV";

  String mainApiBase = "192.168.1.41:8000";
  DependencyProvider({@required env}) {
    if (env == "PROD") {
      //  DO PROD STUFF HERE
    }
  }
}
