import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:product_list_task/api/product/product.dart';

class ProductsApi {
  Future<List<dynamic>> fetch() async {
    final response = await http.get(Uri.https('fakestoreapi.com', '/products'));
    final json = convert.jsonDecode(response.body);
    return json.map((product) => Product.fromJson(product)).toList()
        as List<dynamic>;
  }
}
