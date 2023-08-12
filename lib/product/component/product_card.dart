import 'package:deliciousdal/common/const/colors.dart';
import 'package:deliciousdal/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Widget image;
  final String name;
  final String info;
  final int price;

  const ProductCard({
    required this.image,
    required this.name,
    required this.info,
    required this.price,
    super.key,
  });

  factory ProductCard.fromModel({
    required RestaurantFoodModel model,
  }) {
    return ProductCard(
      image: Image.asset(
        model.img,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
      name: model.name,
      info: model.info,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            child: image,
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  info,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, // ...표시
                  style: TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '$price원',
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
