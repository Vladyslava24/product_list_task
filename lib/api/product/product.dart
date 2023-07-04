import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:product_list_task/api/product/rating.dart';

@immutable
class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final dynamic price;
  final String category;
  final String description;
  final String image;
  final Rating rating;

  @override
  List<Object?> get props => [id];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}
