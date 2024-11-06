import 'dart:convert';
import '../models/product.dart';

class ProductService {

  static List<Product> products = [];

  static void loadProductsFromJson(String jsonString) {
    final List<dynamic> jsonData = jsonDecode(jsonString);
    products = jsonData.map((json) => Product.fromJson(json)).toList();
  }
}
