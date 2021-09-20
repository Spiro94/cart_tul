import 'package:cart_tul/presentation/pages/home/bloc/home_bloc.dart';
import 'package:cart_tul/presentation/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Product List',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is ProductsObtained) {
                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        CardProduct(),
                        CardProduct(),
                        CardProduct(),
                        CardProduct(),
                        CardProduct(),
                        CardProduct(),
                        CardProduct(),
                      ],
                      childAspectRatio: 1 / 1.5,
                    );
                  }
                  return Text('Cargando');
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
