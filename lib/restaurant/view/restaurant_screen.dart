import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  // Future<List> paginateRestaurant() async {
  //   final dio = Dio();
  //   final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
  //   final resp = await dio.get(
  //     'http://$ip/restaurant',
  //     options: Options(headers: {'authorization': 'Bearer $accessToken'}),
  //   );
  //   return resp.data['data'];
  // }
  // final resp = await client
  //     .from('store')
  //     .select()
  //     .then((value) => {print('value는 $value')});

  Future<dynamic> readData() async {
    final resp = await client.from('store').select();
    print('data는 $resp');
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    // readData();
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<dynamic>(
            future: readData(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) {
                return Container(
                  child: Text('No More Data'),
                );
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
