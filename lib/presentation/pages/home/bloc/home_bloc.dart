import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_tul/core/usecase/usecase.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/domain/usecases/get_product_list.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductList usecase;
  HomeBloc(this.usecase) : super(ProductsObtained());

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
