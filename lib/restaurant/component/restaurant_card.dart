import 'package:deliciousdal/common/const/colors.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  // 이미지
  final Widget image;
  // 레스토랑 이름
  final String name;
  // 레스토랑 태그
  final bool takeout;
  // 평점 갯수
  final int ratingsCount;
  // 배송 걸리는 시간
  final int deliveryTime;
  // 배송 시간
  final int deliveryFee;
  // 평점 평균
  final double ratings;

  const RestaurantCard(
      {required this.image,
      required this.name,
      required this.takeout,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings,
      super.key});

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
          takeout ? '포장가능' : '',
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
              icon: Icons.receipt,
              label: ratingsCount.toString(),
            ),
            renderDot(),
            _IconText(
              icon: Icons.timelapse_outlined,
              label: '$deliveryTime 분',
            ),
            renderDot(),
            _IconText(
              icon: Icons.monetization_on,
              label: deliveryFee == 0 ? '무료' : deliveryFee.toString(),
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
