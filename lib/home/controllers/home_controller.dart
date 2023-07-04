import 'package:flutter/foundation.dart';
import 'package:product_list_task/api/product/products_api.dart';

class HomeController extends ChangeNotifier {
  HomeController(this._productsApi);

  final ProductsApi _productsApi;

  late List<dynamic> products = [];

  Future? loadingFuture;

  Future<void> init() async {
    loadingFuture = _productsApi.fetch();
    products = await loadingFuture;
  }

  void refresh() {
    loadingFuture = _productsApi.fetch();
    notifyListeners();
  }
}
