import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(headers: {'authorization': 'Bearer $accessToken'}),
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<List>(
              future: paginateRestaurant(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return RestaurantCard(
                        image: Image.asset(
                          'assets/images/food/ban01.jpg',
                          fit: BoxFit.cover,
                        ),
                        name: '반미에 반하다',
                        tags: ['샌드위치', '반미'],
                        ratingsCount: 120,
                        deliveryTime: 15,
                        deliveryFee: 2100,
                        ratings: 4.12,
                      );
                    },
                    separatorBuilder: (_, index) {
                      return SizedBox(
                        height: 16.0,
                      );
                    });
                print(snapshot.error);
                print(snapshot.data);
              },
            )),
      ),
    );
  }
}
