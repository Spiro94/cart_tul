import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/cart.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item.dart';
import '../../../../domain/usecases/checkout_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CheckoutCart usecase;
  CartBloc(this.usecase) : super(CartLoading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is CartItemAdded) {
      yield* _mapCartItemAddedToState(event, state);
    } else if (event is CartItemUpdated) {
      yield* _mapCartItemUpdatedToState(event, state);
    } else if (event is CartItemDeleted) {
      yield* _mapCartItemDeletedToState(event, state);
    } else if (event is CartCheckout) {
      yield* _mapCartCheckoutToState(event, state);
    } else if (event is CartCleared) {
      yield* _mapCartClearedToState(event, state);
    }
  }

  Stream<CartState> _mapCartItemAddedToState(
      CartItemAdded event, CartState state) async* {
    if (state is CartLoaded) {
      int index = state.cart.items
          .indexWhere((item) => item.product.id == event.item.product.id);
      if (index == -1) {
        yield CartLoaded(
            Cart(items: [...state.cart.items, _createItem(event.item)]));
      } else {
        state.cart.items[index] =
            _createItem(state.cart.items[index], created: 1);
        yield CartLoaded(Cart(items: List.from(state.cart.items)));
      }
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield CartLoaded(Cart(items: []));
  }

  Stream<CartState> _mapCartItemUpdatedToState(
      CartItemUpdated event, CartState state) async* {
    if (state is CartLoaded) {
      final updatedProducts = state.cart.items
          .map(
            (item) => item.product.id == event.item.product.id
                ? _createItem(event.item,
                    increment: event.item.quantity > item.quantity)
                : item,
          )
          .toList();

      yield CartLoaded(Cart(items: updatedProducts));
    }
  }

  Stream<CartState> _mapCartClearedToState(
      CartCleared event, CartState state) async* {
    if (state is CartLoaded) {
      yield CartLoaded(Cart());
    }
  }

  Stream<CartState> _mapCartItemDeletedToState(
      CartItemDeleted event, CartState state) async* {
    if (state is CartLoaded) {
      state.cart.items
          .removeWhere((item) => item.product.id == event.item.product.id);

      yield CartLoaded(Cart(items: state.cart.items));
    }
  }

  Stream<CartState> _mapCartCheckoutToState(
      CartCheckout event, CartState state) async* {
    if (state is CartLoaded) {
      yield CartLoading();
      try {
        var cart = Cart(items: event.cart.items, status: CartStatus.completed);
        var response = await usecase.call(Params(cart));

        yield response.fold(
            (l) => CartLoaded(event.cart, success: false),
            (r) => r
                ? CartLoaded(Cart(), completed: true)
                : CartLoaded(event.cart, success: false));
      } catch (e) {
        yield CartLoaded(event.cart, success: false);
      }
    }
  }

  Item _createItem(Item item, {int created = 0, bool increment = true}) {
    int price;
    if (increment) {
      price = item.price + item.product.unitPrice;
    } else {
      price = item.price - item.product.unitPrice;
    }
    return Item(item.product, quantity: item.quantity + created, price: price);
  }
}
