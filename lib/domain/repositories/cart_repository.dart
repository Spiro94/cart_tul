import 'package:cart_tul/core/error/failure.dart';
import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Product>>> getProductList();
  Future<Either<Failure, bool>> submitOrder();
}
