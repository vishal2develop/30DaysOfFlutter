import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';
import './catalog_image.dart';
import '../home_widgets/add_to_cart.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(context.accentColor).bold.make(),
          catalog.desc.text.sm.make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.make(),
              AddToCart(catalog: catalog)
            ],
          ).pOnly(right: 8)
        ],
      ).p(context.isMobile ? 0 : 16))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(
                    children: children2,
                  ))
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py16();
  }
}
