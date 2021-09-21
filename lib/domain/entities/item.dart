import 'package:equatable/equatable.dart';

import 'product.dart';

class Item {
  final Product product;
  final int quantity;
  final int price;

  Item(this.product, {this.quantity = 1, this.price = 0});
}
