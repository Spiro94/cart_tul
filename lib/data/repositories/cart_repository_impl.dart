import 'dart:convert';

import 'package:cart_tul/data/models/product_model.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/core/error/failure.dart';
import 'package:cart_tul/domain/repositories/cart_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    try {
      // TODO: implement getProductList
      var snapshot = await products.get();

      final list = snapshot.docs
          .map((doc) =>
              ProductModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      final List<Product> products1 = [];
      return Right(products1);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> submitOrder() async {
    try {
      // TODO: implement submitOrder

      return Right(true);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
