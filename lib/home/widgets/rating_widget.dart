import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.initialRating,
  });

  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemSize: 7,
      itemBuilder: (context, _) => Container(
        height: 7,
        width: 7,
        decoration: const BoxDecoration(
          color: Color(0xFFFFD646),
          shape: BoxShape.circle,
        ),
      ),
      unratedColor: const Color(0xFFE6E6E6),
      onRatingUpdate: (rating) {},
    );
  }
}
