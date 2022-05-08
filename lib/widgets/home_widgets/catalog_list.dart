import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import './catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                child: CatalogItem(catalog: catalog),
                onTap: () => context.vxNav.push(
                    Uri(
                        path: MyRoutes.homeDetailsRoute,
                        queryParameters: {"id": catalog.id.toString()}),
                    params: catalog),
              );
            },
            itemCount: CatalogModel.items.length,
          )
        : ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  child: CatalogItem(catalog: catalog),
                  onTap: () => context.vxNav.push(
                      Uri.parse(MyRoutes.homeDetailsRoute),
                      params: catalog));
            },
            itemCount: CatalogModel.items.length,
          );
    ;
  }
}
