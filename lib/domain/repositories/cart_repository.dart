import '../entities/cart.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Product>>> getProductList();
  Future<Either<Failure, bool>> checkoutCart(Cart cart);
}
