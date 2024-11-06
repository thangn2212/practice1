import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges_lib;
import '../models/product.dart';
import '../services/product_service.dart';
import '../services/order_service.dart';
import 'order_screen.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int get cartItemCount {
    return OrderService.orders.fold(0, (sum, order) => sum + order.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Danh sách sản phẩm",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: ProductService.products.length,
        itemBuilder: (context, index) {
          final product = ProductService.products[index];
          return ListTile(
            title: Text(
              product.name,
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              "${product.currency} ${product.price}",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              setState(() {
                OrderService.addProductToOrder(product);
              });
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderScreen()),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(Icons.shopping_cart, size: 30),
            Positioned(
              right: -25,
              top: -25,
              child: badges_lib.Badge(
                badgeContent: Text(
                  cartItemCount.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                badgeColor: Colors.red,
                padding: EdgeInsets.all(8),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
