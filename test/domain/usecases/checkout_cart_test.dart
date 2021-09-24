import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/entities/item.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/domain/repositories/cart_repository.dart';
import 'package:cart_tul/domain/usecases/checkout_cart.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_product_list_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late MockCartRepository mockCartRepository;
  late CheckoutCart usecase;

  setUp(() {
    mockCartRepository = MockCartRepository();
    usecase = CheckoutCart(mockCartRepository);
  });

  const tCart = Cart(items: [
    Item(
      Product('name', 'sku', 'description', 'imageUrl', 20),
      quantity: 1,
      price: 20,
    ),
  ]);
  test('should checkout the items in the cart', () async {
    //arrange
    when(mockCartRepository.checkoutCart(any)).thenAnswer((_) async {
      return const Right(true);
    });
    //act
    final result = await usecase(Params(tCart));
    //assert

    expect(result, const Right(true));
    verify(mockCartRepository.checkoutCart(any));
    verifyNoMoreInteractions(mockCartRepository);
  });
}
