import 'package:cart_tul/core/error/failure.dart';
import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/domain/usecases/get_product_list.dart';
import 'package:cart_tul/presentation/pages/home/bloc/home_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([GetProductList])
void main() {
  late HomeBloc bloc;
  late MockGetProductList mockGetProductList;

  setUp(() {
    mockGetProductList = MockGetProductList();
    bloc = HomeBloc(mockGetProductList);
  });

  const tProducts = [
    Product('name', 'sku', 'description', 'imageUrl', 20),
    Product('name1', 'sku1', 'description1', 'imageUrl1', 2)
  ];

  test('initial state should be ProductsObtained', () {
    // assert
    expect(bloc.state, const ProductsObtained());
  });

  test('should get the product list from the usecase', () async {
    //arrange
    when(mockGetProductList(any))
        .thenAnswer((_) async => const Right(tProducts));
    //act
    bloc.add(GetProducts());
    await untilCalled(mockGetProductList(any));

    //assert
    verify(mockGetProductList(NoParams()));
  });

  test(
      'should emit [ProductsLoading, ProductsObtained] when data is gotten successfully',
      () async {
    //arrange
    when(mockGetProductList(any))
        .thenAnswer((_) async => const Right(tProducts));
    //assert later
    final expected = [
      ProductsLoading(),
      const ProductsObtained(tProducts),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    //act
    bloc.add(GetProducts());
  });

  test('should emit [ProductsLoading, ProductError] when getting data fails',
      () async {
    //arrange
    when(mockGetProductList(any))
        .thenAnswer((_) async => Left(Failure('Error')));
    //assert later
    final expected = [
      ProductsLoading(),
      ProductsError(),
    ];

    expectLater(bloc.stream, emitsInOrder(expected));

    //act
    bloc.add(GetProducts());
  });
}
