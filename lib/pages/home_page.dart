import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
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
    // replicating array items by passing in a number and referece list item
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(title: Text('Catalog App')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index],
              );
            },
          ),
        ));
  }
}
