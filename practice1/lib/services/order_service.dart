import '../models/order.dart';
import '../models/product.dart';

class OrderService {
  static List<Order> orders = [];

  // Thêm sản phẩm vào order
  static void addProductToOrder(Product product) {
    final order = orders.firstWhere(
          (order) => order.product.id == product.id,
      orElse: () => Order(product: product, quantity: 0),
    );

    if (order.quantity == 0) {
      orders.add(order);
    }
    order.quantity += 1;
  }
}

