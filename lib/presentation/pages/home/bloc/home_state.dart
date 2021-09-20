part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ProductsObtained extends HomeState {
  final List<Product> products;

  ProductsObtained([this.products = const []]);

  @override
  List<Object> get props => [products];
}

class ProductsLoading extends HomeState {}

class ProductsError extends HomeState {}
