import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item.dart';
import '../../../../domain/entities/product.dart';
import '../../../../domain/usecases/submit_order.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final SubmitOrder usecase;
  CartBloc(this.usecase) : super(const ProductModified([]));

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddProductEvent) {
      if (state is ProductModified) {
        //Verificar si ya está el producto en la lista.
        //Calcular valor total de los productos

        final list = List.of((state as ProductModified).items)
          ..add(calculatePrice(event.item));
        yield ProductModified(list);
      }
    } else if (event is UpdateProductEvent) {
      final updatedProducts = (state as ProductModified)
          .items
          .map(
            (item) => item.product.id == event.item.product.id
                ? calculatePrice(event.item)
                : item,
          )
          .toList();
      yield ProductModified(updatedProducts);
    }
  }

  Item calculatePrice(Item item) {
    item.price = item.quantity * item.product.price;
    return item;
  }
}
