import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'add_to_cart_button.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                '\$ ${product.unitPrice}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          AddToCartButton(product: product),
        ],
      ),
    );
  }
}
