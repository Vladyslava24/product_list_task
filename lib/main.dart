import 'package:flutter/material.dart';
import 'package:product_list_task/api/auth/auth_api.dart';
import 'package:product_list_task/api/product/products_api.dart';
import 'package:product_list_task/authorization/controllers/login_controller.dart';
import 'package:product_list_task/home/controllers/home_controller.dart';
import 'package:product_list_task/router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>(
          create: (context) => LoginController(AuthApi()),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (context) => HomeController(ProductsApi()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Product List Task',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
