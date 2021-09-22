import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_tul/domain/entities/cart.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item.dart';
import '../../../../domain/usecases/submit_order.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final SubmitOrder usecase;
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
