import 'package:flutter/material.dart';
import './widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/cart_page.dart';

import './utils/routes.dart';

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
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
