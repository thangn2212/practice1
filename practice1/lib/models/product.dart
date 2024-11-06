class Product {
  final String id;
  final String name;
  final double price;
  final String currency;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
  });

  // Tạo Product từ JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Item'],
      name: json['ItemName'],
      price: json['Price'].toDouble(),
      currency: json['Currency'],
    );
  }
}
