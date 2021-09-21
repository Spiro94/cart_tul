import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/cart_repository.dart';

class SubmitOrder implements UseCase<Future<Either<Failure, bool>>, NoParams> {
  final CartRepository repository;

  SubmitOrder(this.repository);
  @override
  call(NoParams params) async {
    return await repository.submitOrder();
  }
}
