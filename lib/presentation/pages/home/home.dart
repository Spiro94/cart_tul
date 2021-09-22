import 'package:cart_tul/presentation/pages/home/widgets/cart_button.dart';

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
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: const [CartButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
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
                    CircularProgressIndicator(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Cargando')
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
