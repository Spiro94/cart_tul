abstract class UseCase<Type, P> {
  Type call(P params);
}

class NoParams {}

class Params {
  final String query;
  const Params(this.query);
}
