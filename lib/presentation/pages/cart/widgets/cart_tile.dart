import '../../../../depedency_injection/dependency_injection.dart';
import '../../../../domain/entities/item.dart';
import '../bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartTile extends StatelessWidget {
  final Item item;
  const CartTile(
    this.item, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.simpleCurrency(decimalDigits: 0);
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
            subtitle: Text('Subtotal: ${currencyFormatter.format(item.price)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAddButton(context),
                Text(
                  item.quantity.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
                _buildRemoveButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildRemoveButton(BuildContext context) {
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
          color: item.quantity == 1 ? null : Theme.of(context).primaryColor,
        ));
  }

  IconButton _buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        var tempItem =
            Item(item.product, quantity: item.quantity + 1, price: item.price);
        instance<CartBloc>().add(CartItemUpdated(tempItem));
      },
      icon: Icon(
        Icons.add_circle,
        color: Theme.of(context).primaryColor,
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
