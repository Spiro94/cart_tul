import 'package:equatable/equatable.dart';

import 'product.dart';

class Item extends Equatable {
  final Product product;
  final int quantity;
  final int price;

  const Item(this.product, {this.quantity = 1, this.price = 0});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        Product.fromJson(json['product']),
        quantity: json['quantity'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
        'quantity': quantity,
        'price': price,
      };

  @override
  List<Object?> get props => [product, quantity, price];
}
