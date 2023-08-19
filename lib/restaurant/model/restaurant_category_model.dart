import 'package:json_annotation/json_annotation.dart';

class RestaurantCategoryModel {
  final String id;
  final String name;
  final String status;
  final String img;

  RestaurantCategoryModel({
    required this.id,
    required this.name,
    required this.status,
    required this.img,
  });

  factory RestaurantCategoryModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantCategoryModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      img: json['img'],
    );
  }
}
