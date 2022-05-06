import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

import '../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Hello";

  final url = "https://api.jsonbin.io/b/6275284525069545a32e51eb";
  Map<String, String> reqHeaders = {
    'X-Master-Key':
        "\$2b\$10\$Ea9GJbtst7aCWFUMOBdwO.lFR9cEWGWdqKi7sdU9Kpna1DFCOL/de"
  };

  @override
  void initState() {
    super.initState();
    // Loading data on screen load
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));

    // getting data from assets
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    // Getting data from network

    final response = await http.get(Uri.parse(url), headers: reqHeaders);
    final catalogJson = response.body;

    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  // double pi = 3.14;
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // replicating array items by passing in a number and referece list item
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
            builder: (context, _, __) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.cartRoute);
                },
                child: Icon(
                  CupertinoIcons.cart,
                  color: Colors.white,
                ),
                backgroundColor: context.theme.buttonColor,
              ).badge(
                  color: Vx.red500,
                  size: 22,
                  count: _cart.items.length,
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold));
            },
            mutations: {AddMutation, RemoveMutation}),
        body: SafeArea(
            child: Container(
                padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      CatalogList().py16().expand()
                    else
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ))));
  }
}
