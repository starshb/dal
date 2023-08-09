import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/product/component/product_card.dart';
import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:flutter/material.dart';

import 'restaurant_screen.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '반미에 반하다 ',
      child: CustomScrollView(
        slivers: [
          renderTop(),
          renderLabel(),
          renderProducts(),
        ],
      ),

      // Column(
      //   children: [
      //     RestaurantCard(
      //       image: Image.asset('assets/images/food/ban01.jpg'),
      //       name: '반미에 반하다',
      //       takeout: false,
      //       info: '\'반미에 반하다\' 강남점입니다.',
      //       deliveryTime: 15,
      //       deliveryFee: 1000,
      //       ratings: 4.2,
      //       isDetail: true,
      //       detail: '반미에 반하다',
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       child: ProductCard(),
      //     ),
      //   ],
      // ),
    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard(),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop() {
    return SliverToBoxAdapter(
      child: RestaurantCard(
        image: Image.asset('assets/images/food/ban01.jpg'),
        name: '반미에 반하다',
        takeout: false,
        info: '\'반미에 반하다\' 강남점입니다.',
        deliveryTime: 15,
        deliveryFee: 1000,
        ratings: 4.2,
        isDetail: true,
        detail: '반미에 반하다',
      ),
    );
  }
}
