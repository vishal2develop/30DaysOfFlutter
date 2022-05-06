import 'package:flutter_catalog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel {
  // Creating a Single ton class

  // static final cartModel = CartModel._internal();

  // CartModel._internal();
  // factory CartModel() => cartModel;

  // catalog field
  CatalogModel _catalog = CatalogModel();

  // collection of ids - store ids of each item
  final List<int> _itemIds = [];

  // getter for _catalog
  CatalogModel get catalog => _catalog;

// setter for _catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// below methods are not required now as we have introduced State Management
  // // Add item

  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  // // Remove Item
  // void remove(Item item) {
  //   _itemIds.remove(item.id);
  // }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    // add item to cart
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    // remove item from cart
    store?.cart._itemIds.remove(item.id);
  }
}
