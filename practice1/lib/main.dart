import 'package:flutter/material.dart';
import 'screens/product_screen.dart';
import 'services/product_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả lập JSON
    String jsonString = '[{"Item": "A1000", "ItemName": "Iphone 15", "Price": 1200, "Currency": "USD"},'
        '{"Item": "A1001", "ItemName": "Iphone 16", "Price": 1500, "Currency": "USD"}]';
    ProductService.loadProductsFromJson(jsonString);

    return MaterialApp(
      title: 'Order App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductScreen(),
    );
  }
}
