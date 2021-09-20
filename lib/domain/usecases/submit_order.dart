import 'package:cart_tul/core/error/failure.dart';
import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class SubmitOrder implements UseCase<Future<Either<Failure, bool>>, NoParams> {
  final CartRepository repository;

  SubmitOrder(this.repository);
  @override
  call(NoParams params) async {
    return await repository.submitOrder();
  }
}
