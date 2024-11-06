import 'product.dart';

class Order {
  final Product product;
  int quantity;

  Order({
    required this.product,
    this.quantity = 1,
  });
}
