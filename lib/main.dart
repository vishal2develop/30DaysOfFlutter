import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import './widgets/themes.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/cart_page.dart';

import './utils/routes.dart';

// entry point

void main() {
  runApp(VxState(store: MyStore(), interceptors: [], child: MyApp()));
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
      initialRoute: MyRoutes.loginRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
