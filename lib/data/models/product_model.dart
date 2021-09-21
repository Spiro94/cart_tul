import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel(
    String id,
    String name,
    String sku,
    String description,
    String imageUrl,
    int price,
  ) : super(
          id,
          name,
          sku,
          description,
          imageUrl,
          price,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        json['id'] ?? '',
        json['name'],
        json['sku'],
        json['description'],
        json['image_url'],
        json['price'],
      );
}
