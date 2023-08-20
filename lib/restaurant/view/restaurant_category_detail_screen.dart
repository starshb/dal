import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:deliciousdal/restaurant/model/restaurant_model.dart';
import 'package:deliciousdal/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/const/data.dart';

class RestaurantCategoryDetailScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  RestaurantCategoryDetailScreen({
    required this.categoryId,
    required this.categoryName,
    super.key,
  });

  Future<dynamic> readData() async {
    final resp =
        await client.from('store').select().eq('category_id', categoryId);
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: categoryName,
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<dynamic>(
              future: readData(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                print('data는? ${snapshot.data}');
                if (!snapshot.hasData || snapshot.data.length == 0) {
                  return Container(
                    child: Center(
                      child: Text(
                        '근처에 가까운 가게가 없습니다.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
