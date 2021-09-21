import 'package:cart_tul/domain/entities/item.dart';

import '../../depedency_injection/dependency_injection.dart';
import '../../domain/entities/product.dart';
import '../pages/cart/bloc/cart_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  const CardProduct(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage(
                width: 100,
                placeholder: const AssetImage('assets/images/placeholder.png'),
                image: NetworkImage(product.imageUrl),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '\$ ${product.price}',
                style: const TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  instance<CartBloc>().add(AddProductEvent(Item(product)));
                },
                child: const Icon(Icons.add, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  primary: Colors.blue, // <-- Button color
                ),
              )),
        ],
      ),
    );
  }
}
