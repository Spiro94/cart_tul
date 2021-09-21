import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is ProductModified) {
        if (state.items.isNotEmpty) {
          return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items[index].product.name),
                );
              });
        }
      }
      return const Center(
        child: Text('No items added yet!'),
      );
    }));
  }
}
