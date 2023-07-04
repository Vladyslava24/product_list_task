import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_list_task/home/controllers/home_controller.dart';
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
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: const Icon(Icons.menu),
          itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: const Text("Log out"),
                onTap: () => context.go('/'),
              ),
            ];
          },
        ),
        titleSpacing: 16,
        title: const SizedBox(
          height: 34,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            cursorHeight: 18,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFEEEEEE),
              border: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.all(Radius.circular(21)),
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xFFA0A0A0),
              ),
            ),
          ),
        ),
      ),
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
