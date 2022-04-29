import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final days = 30;
  final name = "Hello";
  // double pi = 3.14;
  // bool isMale = true;
  // num temp = 30.5;

  // var day = "Tuesday";
  // const pi2 = 3.14;
  // final result = 'done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catalog App')),
      body: Center(
          child: Container(
              child: Text('Welcome to $days days of flutter by $name!'))),
      drawer: MyDrawer(),
    );
  }
}
