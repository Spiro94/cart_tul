import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/cart_repository.dart';

class CheckoutCart implements UseCase<Future<Either<Failure, bool>>, Params> {
  final CartRepository repository;

  CheckoutCart(this.repository);
  @override
  call(Params params) async {
    return await repository.checkoutCart(params.cart);
  }
}
