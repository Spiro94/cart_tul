import 'package:cart_tul/domain/entities/product.dart';

class Order {
  final Product product;
  final int quantity;

  Order(this.product, this.quantity);
}
