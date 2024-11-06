import 'package:flutter/material.dart';
import '../services/order_service.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách đặt hàng")),
      body: ListView.builder(
        itemCount: OrderService.orders.length,
        itemBuilder: (context, index) {
          final order = OrderService.orders[index];
          return ListTile(
            title: Text(order.product.name),
            subtitle: Text("${order.product.currency} ${order.product.price} x ${order.quantity}"),
          );
        },
      ),
    );
  }
}
