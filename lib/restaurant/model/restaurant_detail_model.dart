import 'package:deliciousdal/restaurant/model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  final List<RestaurantFoodModel> food;
  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.info,
    required super.status,
    required super.img,
    required super.address,
    required super.phone,
    required super.ratings,
    required super.takeout,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.food,
  });

  factory RestaurantDetailModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantDetailModel(
      id: json['id'],
      name: json['name'],
      info: json['info'],
      status: json['status'],
      img: json['img'],
      address: json['address'],
      phone: json['phone'],
      ratings: json['ratings'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      takeout: json['takeout'],
      food: json['food']
          .map<RestaurantFoodModel>(
            (x) => RestaurantFoodModel.fromJson(json: x),
          )
          .toList(),
    );
  }
}

class RestaurantFoodModel {
  final String id;
  final String name;
  final String img;
  final int price;
  final String info;
  final String status;

  RestaurantFoodModel({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    required this.info,
    required this.status,
  });

  factory RestaurantFoodModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantFoodModel(
      id: json['id'],
      name: json['name'],
      img: json['img'],
      price: json['price'],
      info: json['info'],
      status: json['status'],
    );
  }
}
