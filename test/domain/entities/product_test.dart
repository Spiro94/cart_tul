import 'dart:convert';

import 'package:cart_tul/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json/reader.dart';

void main() {
  const tProduct = Product('name', 'sku', 'description', 'imageUrl', 20);
  test('fromJson should return a valid model', () async {
    //arrange

    final Map<String, dynamic> jsonMap = json.decode(reader('product'));
    //act
    final result = Product.fromJson(jsonMap);
    //assert
    expect(result, tProduct);
  });
}
