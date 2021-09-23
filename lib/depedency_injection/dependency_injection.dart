import 'package:cart_tul/domain/usecases/checkout_cart.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/cart_repository_impl.dart';
import '../domain/repositories/cart_repository.dart';
import '../domain/usecases/get_product_list.dart';
import '../presentation/pages/cart/bloc/cart_bloc.dart';
import '../presentation/pages/home/bloc/home_bloc.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton(() => HomeBloc(instance()));
  instance.registerLazySingleton(() => CartBloc(instance()));

  instance.registerLazySingleton(() => GetProductList(instance()));
  instance.registerLazySingleton(() => CheckoutCart(instance()));

  instance.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
}
