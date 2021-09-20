import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/entities/order.dart';

class CartModel extends Cart {
  CartModel(
    List<Order> orders,
    String status,
  ) : super(
          orders,
          status,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      json['orders'],
      json['status'],
    );
  }
}
