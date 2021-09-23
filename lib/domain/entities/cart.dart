import 'item.dart';

class Cart {
  final List<Item> items;
  final CartStatus status;

  Cart({this.items = const <Item>[], this.status = CartStatus.pending});

  factory Cart.fromJson(Map<String, dynamic> json) {
    var items = <Item>[];

    for (var item in json['items']) {
      items.add(Item.fromJson(item));
    }
    return Cart(
      items: items,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    var listMap = [];

    for (var item in items) {
      listMap.add(item.toJson());
    }
    return {
      'items': listMap,
      'status': status.toShortString(),
    };
  }
}

enum CartStatus { pending, completed }

extension ParseToString on CartStatus {
  String toShortString() {
    return toString().split('.').last;
  }
}
