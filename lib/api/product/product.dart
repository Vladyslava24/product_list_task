import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
  });

  final int id;
  final String title;
  final String category;
  final String description;
  final String image;

  @override
  List<Object?> get props => [id];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
