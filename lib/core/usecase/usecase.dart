import '../../domain/entities/cart.dart';

abstract class UseCase<Type, P> {
  Type call(P params);
}

class NoParams {}

class Params {
  final Cart cart;

  Params(this.cart);
}
