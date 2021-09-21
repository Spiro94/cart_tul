import '../cart/bloc/cart_bloc.dart';
import 'bloc/home_bloc.dart';
import '../../widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Product added to cart')));
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Product List',
                      style: TextStyle(fontSize: 20),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        int counter = 0;
                        var iconData = Icons.shopping_cart_outlined;

                        if (state is ProductModified) {
                          if (state.items.isNotEmpty) {
                            iconData = Icons.shopping_cart;
                            counter = state.items.length;
                          }
                        }

                        return Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/cart');
                              },
                              icon: Icon(
                                iconData,
                              ),
                            ),
                            if (counter > 0)
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                maxRadius: 7,
                                child: Text(
                                  counter.toString(),
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                    if (state is ProductsObtained) {
                      return GridView.builder(
                        itemBuilder: (context, index) {
                          return CardProduct(state.products[index]);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1 / 1.5,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: state.products.length,
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Cargando')
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
