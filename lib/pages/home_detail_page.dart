import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlushColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.make())
                .wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(children: [
                    catalog.name.text.xl4
                        .color(MyTheme.darkBlushColor)
                        .bold
                        .make(),
                    catalog.desc.text.caption(context).xl.make(),
                    10.heightBox,
                    "Labore erat eos aliquyam ipsum sadipscing diam. Diam sed tempor ea no justo ea, sit sit eos aliquyam sanctus erat sed. Stet stet at sit sadipscing vero ipsum dolores dolores. Dolor et accusam sadipscing accusam, sit lorem labore no elitr sea. Eirmod amet sanctus et takimata amet accusam rebum magna,."
                        .text
                        .caption(context)
                        .make()
                        .p16()
                  ]).py64(),
                ),
              ))
            ],
          )),
    );
  }
}
