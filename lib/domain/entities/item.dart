import 'product.dart';

class Item {
  final Product product;
  int quantity;
  int price;

  Item(this.product, {this.quantity = 1, this.price = 0});
}
