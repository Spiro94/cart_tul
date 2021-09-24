import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  @override
  Future<Either<Failure, List<Product>>> getProductList() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    try {
      var snapshot = await products.get();

      final productList = snapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return Right(productList);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkoutCart(Cart cart) async {
    try {
      CollectionReference products =
          FirebaseFirestore.instance.collection('carts');

      await products.add(cart.toJson());

      return const Right(true);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
