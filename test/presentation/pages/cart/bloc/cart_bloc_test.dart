import 'package:bloc_test/bloc_test.dart';
import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/cart.dart';
import 'package:cart_tul/domain/usecases/checkout_cart.dart';
import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cart_bloc_test.mocks.dart';
import 'cart_bloc_test_const.dart';

@GenerateMocks([CheckoutCart])
void main() {
  late CartBloc bloc;
  late MockCheckoutCart mockCheckoutCart;

  setUp(() {
    mockCheckoutCart = MockCheckoutCart();
    bloc = CartBloc(mockCheckoutCart);
  });

  test('initial state should be CartLoading', () {
    // assert
    expect(bloc.state, CartLoading());
  });

  blocTest<CartBloc, CartState>(
    'emits [CartLoaded(Cart()), CartLoaded(tCartProductAdded)] when'
    '[CartStarted, CartItemAdded] is added.',
    build: () => bloc,
    act: (bloc) {
      bloc.add(CartStarted());
      bloc.add(const CartItemAdded(item));
    },
    expect: () => const <CartState>[
      CartLoaded(Cart()),
      CartLoaded(tCartProductAdded),
    ],
  );

  blocTest<CartBloc, CartState>(
    'emits [CartLoaded(Cart()), CartLoaded(tCartProductAdded),'
    'CartLoaded(tCartProductUpdated)] when [CartStarted, CartItemAdded, CartItemUpdated] is added.',
    build: () => bloc,
    act: (bloc) {
      bloc.add(CartStarted());
      bloc.add(const CartItemAdded(item));
      bloc.add(const CartItemUpdated(itemToUpdate));
    },
    expect: () => const <CartState>[
      CartLoaded(Cart()),
      CartLoaded(tCartProductAdded),
      CartLoaded(tCartProductUpdated),
    ],
  );

  blocTest<CartBloc, CartState>(
    'emits [CartLoaded] when'
    '[CartStarted, CartItemAdded, CartItemDeleted] is added.',
    build: () => bloc,
    act: (bloc) {
      bloc.add(CartStarted());
      bloc.add(const CartItemAdded(item));
      bloc.add(const CartItemDeleted(item));
    },
    expect: () => const <CartState>[
      CartLoaded(Cart()),
      CartLoaded(tCartProductAdded),
      CartLoaded(Cart()),
    ],
  );

  blocTest<CartBloc, CartState>(
    'emits [CartLoaded(Empty)] when'
    '[CartStarted, CartItemAdded, CartCleared] is added.',
    build: () => bloc,
    act: (bloc) {
      bloc.add(CartStarted());
      bloc.add(const CartItemAdded(item));
      bloc.add(const CartCleared());
    },
    expect: () => const <CartState>[
      CartLoaded(Cart()),
      CartLoaded(tCartProductAdded),
      CartLoaded(Cart()),
    ],
  );

  test('should checkout the items in the cart', () async {
    //arrange
    when(mockCheckoutCart(any)).thenAnswer((_) async => const Right(true));
    //act
    bloc.add(CartStarted());
    bloc.add(const CartCheckout(tCart));

    await untilCalled(mockCheckoutCart(any));

    //assert
    verify(mockCheckoutCart(const Params(tCartCompleted)));
  });
}
