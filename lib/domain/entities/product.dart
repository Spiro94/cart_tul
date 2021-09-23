class Product {
  String id;
  final String name;
  final String sku;
  final String description;
  final String imageUrl;
  final int unitPrice;

  Product(
    this.id,
    this.name,
    this.sku,
    this.description,
    this.imageUrl,
    this.unitPrice,
  );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        json['id'] ?? '',
        json['name'],
        json['sku'],
        json['description'],
        json['image_url'],
        json['unit_price'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sku': sku,
      'description': description,
      'image_url': imageUrl,
      'unit_price': unitPrice,
    };
  }
}
