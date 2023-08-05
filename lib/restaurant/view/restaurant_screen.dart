import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: RestaurantCard(
            image: Image.asset('assets/images/food/ban01.jpg'),
            name: '반미에 반하다',
            tags: ['샌드위치', '반미'],
            ratingCount: 120,
            deliveryTime: 15,
            deliveryFee: 2100,
            rating: 4.12,
          ),
        ),
      ),
    );
  }
}
