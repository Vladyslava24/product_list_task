import 'package:flutter/material.dart';
import 'package:product_list_task/home/controllers/home_controller.dart';
import 'package:product_list_task/home/widgets/app_bar.dart';
import 'package:product_list_task/home/widgets/product_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeController>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loadingFuture =
        context.select((HomeController controller) => controller.loadingFuture);
    return Scaffold(
      appBar: CustomAppBar(),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() {
          context.read<HomeController>().refresh();
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Special offers',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF313131),
                  ),
                ),
                const Text(
                  'The best prices',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF313131),
                  ),
                ),
                const SizedBox(height: 30),
                FutureBuilder(
                  future: loadingFuture,
                  builder: (context, snapshot) {
                    if (loadingFuture == null ||
                        snapshot.connectionState == ConnectionState.done) {
                      final products = context.select(
                          (HomeController controller) => controller.products);
                      return products.isNotEmpty
                          ? ProductGrid(products: products)
                          : const Text('Product list is empty');
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
