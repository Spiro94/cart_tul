import '../../domain/entities/cart.dart';
import '../../domain/entities/item.dart';

class CartModel extends Cart {
  CartModel(
    List<Item> items,
    String status,
  ) : super(
          items,
          status,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      json['items'],
      json['status'],
    );
  }
}
