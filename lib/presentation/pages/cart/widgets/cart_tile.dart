import 'package:cart_tul/depedency_injection/dependency_injection.dart';
import 'package:cart_tul/domain/entities/item.dart';
import 'package:cart_tul/presentation/pages/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final Item item;
  const CartTile(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.product.id),
      onDismissed: (direction) {
        instance<CartBloc>().add(CartItemDeleted(item));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          elevation: 5,
          child: ListTile(
            leading: _buildImage(),
            title: Text(item.product.name),
            subtitle: Text('Subtotal: \$ ${item.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildRemoveButton(),
                Text(
                  item.quantity.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                _buildAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildRemoveButton() {
    return IconButton(
        onPressed: item.quantity == 1
            ? null
            : () {
                var tempItem = Item(item.product,
                    quantity: item.quantity - 1, price: item.price);
                instance<CartBloc>().add(CartItemUpdated(tempItem));
              },
        icon: Icon(
          Icons.remove_circle,
          color: item.quantity == 1 ? null : Colors.black,
        ));
  }

  IconButton _buildAddButton() {
    return IconButton(
      onPressed: () {
        var tempItem =
            Item(item.product, quantity: item.quantity + 1, price: item.price);
        instance<CartBloc>().add(CartItemUpdated(tempItem));
      },
      icon: const Icon(
        Icons.add_circle,
        color: Colors.black,
      ),
    );
  }

  FadeInImage _buildImage() {
    return FadeInImage(
      placeholder: const AssetImage('assets/images/placeholder.png'),
      image: NetworkImage(item.product.imageUrl),
    );
  }
}
