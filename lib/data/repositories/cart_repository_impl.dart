import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/product_model.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    try {
      var snapshot = await products.get();

      final productList = snapshot.docs.map((doc) {
        var product = ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        product.id = doc.id;
        return product;
      }).toList();

      return Right(productList);
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
