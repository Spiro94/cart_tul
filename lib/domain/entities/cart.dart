import 'package:cart_tul/domain/entities/order.dart';
import 'package:cart_tul/domain/entities/product.dart';

class Cart {
  final List<Order> orders;
  final String status;

  Cart(this.orders, this.status);
}
