import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 80,
      height: 80,
      image: NetworkImage(url),
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress != null
            ? Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              )
            : child;
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Theme.of(context).focusColor,
          child: const Text('Error'),
        );
      },
    );
  }
}
