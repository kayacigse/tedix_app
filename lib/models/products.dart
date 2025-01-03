class Product {
  final String id;
  final String title;
  final String description;
  final String brand; // Marka bilgisi
  final String imageUrl;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.brand, // Marka bilgisi
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      brand: map['brand'] ?? '', // Marka bilgisi
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? 0.0,
    );
  }
}
