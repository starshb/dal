import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  // 이미지
  final Widget image;
  // 레스토랑 이름
  final String name;
  // 레스토랑 태그
  final List<String> tags;
  // 평점 갯수
  final int ratingCount;
  // 배송 걸리는 시간
  final int deliveryTime;
  // 배송 시간
  final int deliveryFee;
  // 평점 평균
  final double rating;

  const RestaurantCard(
      {required this.image,
      required this.name,
      required this.tags,
      required this.ratingCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.rating,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
