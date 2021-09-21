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
  final UpdateAction updateAction;

  const CartItemUpdated(this.item, {this.updateAction = UpdateAction.increase});

  @override
  List<Object> get props => [item];
}

enum UpdateAction { increase, decrease }

class CartItemDeleted extends CartEvent {
  final Item item;

  const CartItemDeleted(this.item);

  @override
  List<Object> get props => [item];
}

class CartCleared extends CartEvent {
  const CartCleared();
}
