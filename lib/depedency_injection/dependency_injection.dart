import 'package:cart_tul/data/repositories/cart_repository_impl.dart';
import 'package:cart_tul/domain/repositories/cart_repository.dart';
import 'package:cart_tul/domain/usecases/get_product_list.dart';
import 'package:cart_tul/domain/usecases/submit_order.dart';
import 'package:cart_tul/presentation/pages/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerFactory(() => HomeBloc(instance()));

  instance.registerLazySingleton(() => GetProductList(instance()));
  instance.registerLazySingleton(() => SubmitOrder(instance()));

  instance.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
}
