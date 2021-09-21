import 'package:cart_tul/depedency_injection/dependency_injection.dart';
import 'package:cart_tul/domain/entities/item.dart';
import 'package:cart_tul/domain/entities/product.dart';
import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        instance<CartBloc>().add(CartItemAdded(Item(product)));
      },
      child: const Text('Add to cart'),
    );
  }
}
