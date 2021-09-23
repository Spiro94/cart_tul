import '../../depedency_injection/dependency_injection.dart';
import '../../domain/entities/item.dart';
import '../../domain/entities/product.dart';
import '../pages/cart/bloc/cart_bloc.dart';
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
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
      onPressed: () {
        instance<CartBloc>().add(CartItemAdded(Item(product)));
      },
      child: const Text('Add to cart'),
    );
  }
}
