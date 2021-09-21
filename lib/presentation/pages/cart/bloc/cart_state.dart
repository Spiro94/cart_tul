part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class ProductAdded extends CartState {
  final List<Item> items;

  const ProductAdded(this.items);

  @override
  List<Object> get props => [items];
}

class ProductModified extends CartState {
  final List<Item> items;

  const ProductModified(this.items);

  @override
  List<Object> get props => [items];
}

class CartFailure extends CartState {}
