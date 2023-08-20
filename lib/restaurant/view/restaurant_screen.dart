import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:deliciousdal/restaurant/model/restaurant_model.dart';
import 'package:deliciousdal/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/const/data.dart';

class RestaurantScreen extends StatelessWidget {
  bool isCategory;
  final String? storeId;
  RestaurantScreen({
    this.storeId,
    this.isCategory = false,
    super.key,
  });
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
  Future readSt() async {
    final resp = await client.storage.getBucket('deliciousdal');
    print('storage : $resp');
  }

  Future<dynamic> readData() async {
    final resp = await isCategory
        ? client.from('store').select().eq('category_id', storeId)
        : client.from('store').select();
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    // readSt();
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
                  child: CircularProgressIndicator(),
                  // child: Text('No More Data'),
                );
              }
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final pItem = RestaurantModel.fromJson(
                    item,
                  );

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RestaurantDetailScreen(
                            model: pItem,
                            // id: pItem.id,
                            // name: pItem.name,
                            // address: pItem.address,
                            // phone: pItem.phone,
                            // ratings: pItem.ratings,
                            // takeout: pItem.takeout,
                            // info: pItem.info,
                            // deliveryTime: pItem.deliveryTime,
                            // deliveryFee: pItem.deliveryFee,
                            // status: pItem.status,
                            // img: pItem.img,
                          ),
                        ),
                      );
                    },
                    child: RestaurantCard.fromModel(
                      model: pItem,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return SizedBox(
                    height: 16.0,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
