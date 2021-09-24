import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/domain/repositories/cart_repository.dart';
import 'package:cart_tul/domain/usecases/get_product_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_list_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late GetProductList usecase;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    usecase = GetProductList(mockCartRepository);
  });

  const tProducts = [
    Product('name', 'sku', 'description', 'imageUrl', 20),
    Product('name1', 'sku1', 'description1', 'imageUrl1', 2)
  ];
  test('should get list of products from the repository', () async {
    //arrange
    when(mockCartRepository.getProductList()).thenAnswer((_) async {
      return const Right(tProducts);
    });
    //act
    final result = await usecase(NoParams());
    //assert
    expect(result, const Right(tProducts));
    verify(mockCartRepository.getProductList());
    verifyNoMoreInteractions(mockCartRepository);
  });
}
