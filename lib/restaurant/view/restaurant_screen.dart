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

  Future<dynamic> readData() async {
    return client.from('store').select().then((value) => print(value));

    // await client.from('store').insert({
    //   'name': '그 커피 집 신논현점',
    //   'address': '서울시 강남구 봉은사로 24길 14 1층',
    //   'ratings': '3.9',
    //   'phone': '02-156-4568',
    //   'takeout': 'TRUE',
    //   'info': '그 커피 집 신논현점입니다. 향긋한 커피 드시러 오세요!',
    //   'deliveryTime': '15',
    // });
  }

  @override
  Widget build(BuildContext context) {
    readData();
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
                      takeout: true,
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
          ),
        ),
      ),
    );
  }
}
