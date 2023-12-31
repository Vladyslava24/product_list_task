import 'package:flutter/material.dart';
import 'package:product_list_task/home/widgets/product_image.dart';
import 'package:product_list_task/home/widgets/rating_widget.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.products});

  final List<dynamic> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: ProductImage(
                      url: products[index].image,
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
                  RatingWidget(
                      initialRating: double.tryParse(
                          products[index].rating.rate.toString())!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[index].price.toString()),
                      const Icon(
                        Icons.favorite,
                        color: Color(0xFFFF505A),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
