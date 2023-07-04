import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key});

  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
