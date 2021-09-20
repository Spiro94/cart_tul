import 'package:cart_tul/core/error/failure.dart';
import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductList
    implements UseCase<Future<Either<Failure, List<Product>>>, NoParams> {
  final CartRepository repository;

  GetProductList(this.repository);
  @override
  call(NoParams params) async {
    return await repository.getProductList();
  }
}
