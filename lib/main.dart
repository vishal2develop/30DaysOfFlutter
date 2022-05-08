import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_strategy/url_strategy.dart';
import './widgets/themes.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/cart_page.dart';

import './utils/routes.dart';

// entry point

void main() {
  // to remove # in url
  setPathUrlStrategy();
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
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: MyTheme.darkTheme(context),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        '/': (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.homeRoute: (_, __) => MaterialPage(child: HomePage()),
        MyRoutes.loginRoute: (_, __) => MaterialPage(child: LoginPage()),
        MyRoutes.cartRoute: (_, __) => MaterialPage(child: CartPage()),
        MyRoutes.homeDetailsRoute: (uri, _) {
          final String id = uri.queryParameters["id"].toString();
          final catalog =
              (VxState.store as MyStore).catalog.getById(int.parse(id));
          return MaterialPage(
              child: HomeDetailPage(
            catalog: catalog,
          ));
        },
      }),
      // initialRoute: MyRoutes.loginRoute,
      // routes: {
      // '/': (context) => LoginPage(),
      // MyRoutes.homeRoute: (context) => HomePage(),
      // MyRoutes.loginRoute: (context) => LoginPage(),
      // MyRoutes.cartRoute: (context) => CartPage()
      // },
    );
  }
}
