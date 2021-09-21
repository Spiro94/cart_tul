import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/get_product_list.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductList usecase;
  HomeBloc(this.usecase) : super(const ProductsObtained());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetProducts) {
      yield ProductsLoading();
      var result = await usecase.call(NoParams());
      yield result.fold((l) => ProductsError(), (r) => ProductsObtained(r));
    }
  }
}
