import 'dart:convert';

import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/entities/item.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json/reader.dart';

void main() {
  const tCart = Cart(items: [
    Item(
      Product('name', 'sku', 'description', 'imageUrl', 20),
      quantity: 1,
      price: 20,
    ),
  ]);

  test('fromJson should return a valid model', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(reader('cart'));
    //act
    final result = Cart.fromJson(jsonMap);
    //assert
    expect(result, tCart);
  });
}
