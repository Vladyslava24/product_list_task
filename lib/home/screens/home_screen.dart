import 'package:flutter/material.dart';
import 'package:product_list_task/home/controllers/home_controller.dart';
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
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.menu),
        ),
        leadingWidth: 32,
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
                          ? GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                products.length,
                                (index) {
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    shadowColor: Colors.grey,
                                    surfaceTintColor: Colors.transparent,
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            child: Image(
                                              width: 80,
                                              height: 80,
                                              image: NetworkImage(
                                                  products[index].image),
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                return loadingProgress != null
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  loadingProgress
                                                                      .expectedTotalBytes!
                                                              : null,
                                                        ),
                                                      )
                                                    : child;
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: const Text('Error'),
                                                );
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            products[index].title,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFFFD646),
                                                    shape: BoxShape.circle),
                                              ),
                                              const SizedBox(width: 2),
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFFFD646),
                                                    shape: BoxShape.circle),
                                              ),
                                              const SizedBox(width: 2),
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFFFD646),
                                                    shape: BoxShape.circle),
                                              ),
                                              const SizedBox(width: 2),
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFFFD646),
                                                    shape: BoxShape.circle),
                                              ),
                                              const SizedBox(width: 2),
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFFFD646),
                                                    shape: BoxShape.circle),
                                              ),
                                              const SizedBox(width: 2),
                                              Container(
                                                height: 5,
                                                width: 5,
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFFE6E6E6),
                                                    shape: BoxShape.circle),
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('price'),
                                              Icon(Icons.favorite_border),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    //),
                                  );
                                },
                              ),
                            )
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
