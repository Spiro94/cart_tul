part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class ProductsObtained extends HomeState {
  final List<Product> products;

  const ProductsObtained([this.products = const []]);

  @override
  List<Object> get props => [products];
}

class ProductsLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class ProductsError extends HomeState {
  @override
  List<Object> get props => [];
}
