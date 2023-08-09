import 'package:deliciousdal/common/const/colors.dart';
import 'package:flutter/material.dart';

import '../model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  // 이미지
  final Widget image;
  // 레스토랑 이름
  final String name;
  // 레스토랑 태그
  final bool takeout;
  // 배송 걸리는 시간
  final int deliveryTime;
  // 배송 시간
  final int deliveryFee;
  // 평점 평균
  final double ratings;
  // 매장 정보
  final String info;

  const RestaurantCard(
      {required this.image,
      required this.name,
      required this.takeout,
      required this.info,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings,
      super.key});

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
  }) {
    return RestaurantCard(
      image: Image.asset(
        model.img,
        // height: MediaQuery.of(context).size.height / 3, //cover에 맞게 height..?
        fit: BoxFit.cover,
      ),
      name: model.name,
      takeout: model.takeout,
      info: model.info,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: image,
        ),
        SizedBox(
          height: 16.0,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          info!,
          style: TextStyle(
            fontSize: 14.0,
            color: BODY_TEXT_COLOR,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          children: [
            _IconText(
              icon: Icons.star,
              label: ratings.toString(),
            ),
            renderDot(),
            _IconText(
              icon: Icons.timelapse_outlined,
              label: '$deliveryTime 분',
            ),
            renderDot(),
            _IconText(
              icon: Icons.monetization_on,
              label: deliveryFee == '0' ? '무료' : deliveryFee.toString(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                takeout ? '·' : '',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              takeout ? '포장가능' : '',
              style: TextStyle(
                fontSize: 14.0,
                color: BODY_TEXT_COLOR,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
