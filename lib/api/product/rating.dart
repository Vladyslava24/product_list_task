import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Rating extends Equatable {
  const Rating({
    required this.rate,
    required this.count,
  });

  final dynamic rate;
  final int count;

  @override
  List<Object?> get props => [rate];

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}
