import 'package:equatable/equatable.dart';

import '../../domain/entities/cart.dart';

abstract class UseCase<Type, P> {
  Type call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final Cart cart;

  const Params(this.cart);

  @override
  List<Object?> get props => [cart];
}
