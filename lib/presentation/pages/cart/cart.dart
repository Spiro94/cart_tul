import 'package:cart_tul/depedency_injection/dependency_injection.dart';
import 'package:cart_tul/domain/entities/item.dart';
import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:cart_tul/presentation/pages/cart/widgets/cart_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 0);
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
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
                        decoration: const BoxDecoration(
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
                            Text(
                              currencyFormatter
                                  .format(_calculateTotal(state.cart.items))
                                  .toString(),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()),
                                child: const Text('Checkout')),
                          ],
                        ),
                      )),
                ],
              );
            }
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Your cart is empty!'),
                SizedBox(
                  height: 20,
                ),
                Text('Don\'t know what to buy!?'),
                Text('Thousands of products await you!'),
              ],
            ),
          );
        },
      ),
    );
  }

  int _calculateTotal(List<Item> items) =>
      items.fold<int>(0, (total, item) => total + item.price);
}
