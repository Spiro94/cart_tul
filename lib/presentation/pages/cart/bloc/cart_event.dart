part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class CartItemAdded extends CartEvent {
  final Item item;

  const CartItemAdded(this.item);
  @override
  List<Object> get props => [item];
}

class CartItemUpdated extends CartEvent {
  final Item item;

  const CartItemUpdated(this.item);

  @override
  List<Object> get props => [item];
}

class CartItemDeleted extends CartEvent {
  final Item item;

  const CartItemDeleted(this.item);

  @override
  List<Object> get props => [item];
}

class CartCheckout extends CartEvent {
  final Cart cart;

  const CartCheckout(this.cart);

  @override
  List<Object> get props => [cart];
}

class CartCleared extends CartEvent {
  const CartCleared();
}
