import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

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
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
