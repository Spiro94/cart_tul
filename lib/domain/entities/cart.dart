import 'item.dart';

class Cart {
  final List<Item> items;
  final CartStatus status;

  Cart({this.items = const <Item>[], this.status = CartStatus.pending});
}

enum CartStatus { pending, completed }
