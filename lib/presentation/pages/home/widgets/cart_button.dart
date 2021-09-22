import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int counter = 0;
        var iconData = Icons.shopping_cart_outlined;

        if (state is CartLoaded) {
          if (state.cart.items.isNotEmpty) {
            iconData = Icons.shopping_cart;
            counter = state.cart.items
                .fold(0, (total, item) => total + item.quantity);
          }
        }

        return Row(
          children: [
            if (counter > 0)
              CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 10,
                child: Text(
                  counter.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(
                iconData,
              ),
            ),
          ],
        );
      },
    );
  }
}
