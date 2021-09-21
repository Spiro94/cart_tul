import '../../domain/entities/cart.dart';
import '../../domain/entities/item.dart';

class CartModel extends Cart {
  CartModel(
    List<Item> items,
    CartStatus status,
  ) : super(
          items: items,
          status: status,
        );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      json['items'],
      json['status'],
    );
  }
}
