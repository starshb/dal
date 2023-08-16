// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      ratings: (json['ratings'] as num).toDouble(),
      takeout: json['takeout'] as bool,
      info: json['info'] as String,
      deliveryTime: json['deliveryTime'] as int,
      deliveryFee: json['deliveryFee'] as int,
      status: json['status'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'ratings': instance.ratings,
      'takeout': instance.takeout,
      'info': instance.info,
      'deliveryTime': instance.deliveryTime,
      'deliveryFee': instance.deliveryFee,
      'status': instance.status,
      'img': instance.img,
    };
