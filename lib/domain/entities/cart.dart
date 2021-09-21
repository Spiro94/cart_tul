import 'package:equatable/equatable.dart';

import 'item.dart';

class Cart {
  final List<Item> items;
  final CartStatus status;

  Cart({this.items = const <Item>[], this.status = CartStatus.pending});

  // @override
  // List<Object?> get props => [items, status];
}

enum CartStatus { pending, completed }
