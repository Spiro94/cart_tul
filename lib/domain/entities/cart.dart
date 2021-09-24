import 'package:equatable/equatable.dart';

import 'item.dart';

class Cart extends Equatable {
  final List<Item> items;
  final CartStatus status;

  const Cart({this.items = const <Item>[], this.status = CartStatus.pending});

  factory Cart.fromJson(Map<String, dynamic> json) {
    var items = <Item>[];

    for (var item in json['items']) {
      items.add(Item.fromJson(item));
    }
    return Cart(
      items: items,
      status: CartStatus.values
          .firstWhere((e) => e.toShortString() == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    var itemsMap = [];

    for (var item in items) {
      itemsMap.add(item.toJson());
    }
    return {
      'items': itemsMap,
      'status': status.toShortString(),
    };
  }

  @override
  List<Object?> get props => [items, status];
}

enum CartStatus { pending, completed }

extension ParseToString on CartStatus {
  String toShortString() {
    return toString().split('.').last;
  }
}
