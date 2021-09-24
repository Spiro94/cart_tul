import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String sku;
  final String description;
  final String imageUrl;
  final int unitPrice;

  const Product(
    this.name,
    this.sku,
    this.description,
    this.imageUrl,
    this.unitPrice,
  );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        json['name'],
        json['sku'],
        json['description'],
        json['image_url'],
        json['unit_price'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sku': sku,
      'description': description,
      'image_url': imageUrl,
      'unit_price': unitPrice,
    };
  }

  @override
  List<Object?> get props => [name, sku, description, imageUrl, unitPrice];
}
