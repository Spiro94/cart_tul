import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/product.dart';
import '../repositories/cart_repository.dart';
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
