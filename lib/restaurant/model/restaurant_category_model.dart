import 'package:json_annotation/json_annotation.dart';

class RestaurantCategoryModel {
  final String id;
  final String name;
  final String status;

  RestaurantCategoryModel({
    required this.id,
    required this.name,
    required this.status,
  });

  factory RestaurantCategoryModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantCategoryModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
