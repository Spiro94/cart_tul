part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final Cart cart;
  final bool success;
  final bool completed;

  const CartLoaded(this.cart, {this.success = true, this.completed = false});

  @override
  List<Object?> get props => [cart];
}

class CartFailure extends CartState {
  @override
  List<Object> get props => [];
}
