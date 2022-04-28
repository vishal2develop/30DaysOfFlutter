import 'package:flutter/material.dart';
import './home_page.dart';
// entry point

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // contructor
  const MyApp({Key? key}) : super(key: key);

// build for UI development
  @override
  Widget build(BuildContext context) {
    // The main build method has to return either a
    // Material App, Cupertino App or Widgets App
    return MaterialApp(home: HomePage());
  }
}
