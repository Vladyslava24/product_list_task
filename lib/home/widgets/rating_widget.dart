import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xFFFFD646), shape: BoxShape.circle),
        ),
        const SizedBox(width: 2),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xFFFFD646), shape: BoxShape.circle),
        ),
        const SizedBox(width: 2),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xFFFFD646), shape: BoxShape.circle),
        ),
        const SizedBox(width: 2),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xFFFFD646), shape: BoxShape.circle),
        ),
        const SizedBox(width: 2),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xFFFFD646), shape: BoxShape.circle),
        ),
        const SizedBox(width: 2),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
              color: Color(0xFFE6E6E6), shape: BoxShape.circle),
        ),
      ],
    );
  }
}
