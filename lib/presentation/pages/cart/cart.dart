import 'package:cart_tul/depedency_injection/dependency_injection.dart';
import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:cart_tul/presentation/pages/cart/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            IconButton(
              onPressed: () {
                instance<CartBloc>().add(const CartCleared());
              },
              icon: const Icon(Icons.remove_shopping_cart),
            )
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoaded) {
            if (state.cart.items.isNotEmpty) {
              return Stack(
                children: [
                  ListView.builder(
                      itemCount: state.cart.items.length,
                      itemBuilder: (context, index) {
                        return CartTile(state.cart.items[index]);
                      }),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                        ),
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('TOTAL'),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('Checkout')),
                          ],
                        ),
                      )),
                ],
              );
            }
          }
          return const Center(
            child: Text('No items added yet!'),
          );
        }));
  }
}
