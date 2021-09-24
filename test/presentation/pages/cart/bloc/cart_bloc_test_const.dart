import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/entities/item.dart';
import 'package:cart_tul/domain/entities/product.dart';

const tCart = Cart(items: [
  Item(
    Product('name', 'sku', 'description', 'imageUrl', 20),
    quantity: 1,
    price: 20,
  ),
]);

const tCartCompleted = Cart(
  items: [
    Item(
      Product('name', 'sku', 'description', 'imageUrl', 20),
      quantity: 1,
      price: 20,
    ),
  ],
  status: CartStatus.completed,
);

const item = Item(
  Product('name_1', 'sku_1', 'description_1', 'imageUrl_1', 2),
);

const itemToUpdate = Item(
  Product('name_1', 'sku_1', 'description_1', 'imageUrl_1', 2),
  quantity: 2,
  price: 2,
);

const tCartProductAdded = Cart(items: [
  Item(
    Product('name_1', 'sku_1', 'description_1', 'imageUrl_1', 2),
    quantity: 1,
    price: 2,
  )
]);

const tCartProductUpdated = Cart(items: [
  Item(
    Product('name_1', 'sku_1', 'description_1', 'imageUrl_1', 2),
    quantity: 2,
    price: 4,
  )
]);
