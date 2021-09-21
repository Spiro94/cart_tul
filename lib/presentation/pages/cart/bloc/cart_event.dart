part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartItems extends CartEvent {}

class AddProductEvent extends CartEvent {
  final Item item;

  const AddProductEvent(this.item);
  @override
  List<Object> get props => [item];
}

class UpdateProductEvent extends CartEvent {
  final Item item;

  const UpdateProductEvent(this.item);
  @override
  List<Object> get props => [item];
}

class DeleteProductEvent extends CartEvent {
  final Product product;

  const DeleteProductEvent(this.product);
  @override
  List<Object> get props => [product];
}

class ClearCartEvent extends CartEvent {
  const ClearCartEvent();
}
