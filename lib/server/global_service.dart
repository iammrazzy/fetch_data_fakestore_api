import 'package:e_shop/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Main url API
String mainURL = 'https://fakestoreapi.com/';

// Route
class ApiRoute {
  String productRoute = '${mainURL}products/';
}

// Service
class GlobalService {
  // Get product from API
  Future getProucts() async {
    String url = ApiRoute().productRoute;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      debugPrint('👉 Status code: ${response.statusCode}');
      debugPrint('👉 All data: ${response.body}');
      return productModelFromJson(response.body);
    } else {
      return [];
    }
  }
}
