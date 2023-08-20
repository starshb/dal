import 'dart:convert';

import 'package:deliciousdal/common/const/colors.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/product/component/product_card.dart';
import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
import 'package:deliciousdal/restaurant/model/restaurant_detail_model.dart';
import 'package:deliciousdal/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';

import '../../common/const/data.dart';

class RestaurantDetailScreen extends StatelessWidget {
  RestaurantModel model;
  // final String id;
  // final String name;
  // final String address;
  // final String phone;
  // final double ratings;
  // final bool takeout;
  // final String info;
  // final int deliveryTime;
  // final int deliveryFee;
  // final String status;
  // final String img;
  RestaurantDetailScreen({
    required this.model,
    // required this.id,
    // required this.name,
    // required this.address,
    // required this.phone,
    // required this.ratings,
    // required this.takeout,
    // required this.info,
    // required this.deliveryTime,
    // required this.deliveryFee,
    // required this.status,
    // required this.img,
    super.key,
  });

  Future<dynamic> getFood() async {
    final resp = await client.from('food').select().eq('store_id', model.id);
    // print('data는 $resp');
    return resp;
  }
  // Widget

  //   SliverToBoxAdapter renderTop({required dynamic model}) {
//     print('item? $model');
//
//     // <dynamic>형식일때 사용---------
//     final newitem = RestaurantModel.fromJson(model);
//     print('newitem? $newitem');
//     // final pItem = RestaurantModel.fromJson(json: item);
//     // print('pItem? $pItem');
//     //-----------------------------
//
//     return SliverToBoxAdapter(
//       child: RestaurantCard.fromModel(
//         model: newitem,
//         isDetail: true,
//       ),
//     );
//   }
  @override
  Widget build(BuildContext context) {
    // readSt();
    // readData();
    return DefaultLayout(
      title: model.name,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined),
        backgroundColor: SECOND_COLOR,
        onPressed: () {},
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RestaurantCard.fromModel(
              model: model,
              isDetail: true,
            ),
            renderLabel(),
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FutureBuilder<dynamic>(
                    future: getFood(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: CircularProgressIndicator(),
                          // child: Text('No More Data'),
                        );
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          final item = snapshot.data![index];
                          final pItem = RestaurantFoodModel.fromJson(
                            json: item,
                          );

                          return InkWell(
                            onTap: () {},
                            child: ProductCard.fromModel(
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
          ],
        ),
      ),
    );
  }

  Widget renderLabel() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        '메뉴',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

// import 'package:deliciousdal/common/const/data.dart';
// import 'package:deliciousdal/common/layout/default_layout.dart';
// import 'package:deliciousdal/product/component/product_card.dart';
// import 'package:deliciousdal/restaurant/component/restaurant_card.dart';
// import 'package:deliciousdal/restaurant/model/restaurant_detail_model.dart';
// import 'package:deliciousdal/restaurant/model/restaurant_model.dart';
// import 'package:flutter/material.dart';
//
// import 'restaurant_screen.dart';
//
// class RestaurantDetailScreen extends StatelessWidget {
//   final String id;
//
//   const RestaurantDetailScreen({required this.id, super.key});
//
//   //<Map<Stirng,dynamic>>이 아닌 형식으로 잡히는지를 위한 테스트 메서드
//   Future<dynamic> getRestaurantDetail() async {
//     // final resp = await client.from('food').select().eq('store_id', id);
//     final resp = await client.from('store').select('*,food(*)').eq('id', id);
//     // print('resp 는 $resp');
//     return resp;
//   }
//
//   // Future getRestaurant() async {
//   //   final resp = await client.from('store').select().eq('id', id);
//   //   final join = await client.from('store').select('*,food(*)');
//   //   // final data1 = await client
//   //   //     .from('food')
//   //   //     .select('*,store!food_store_id_fkey!left(level)')
//   //   //     .gte('store_id.level', 2);
//   //   // return resp;
//   // }
//
// //<Map<String, dynamic>>이 아닌 형식으로 잡히는지를 위한 테스트
//   @override
//   Widget build(BuildContext context) {
//     return DefaultLayout(
//       title: '반미에 반하다',
//       child: FutureBuilder<dynamic>(
//         future: getRestaurantDetail(),
//         builder: (_, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done)
//             print('스냅샷 데이터완료 ${snapshot.data}');
//           else if (snapshot.connectionState == ConnectionState.none)
//             print('스냅샷 데이터 시작 ${snapshot.data}');
//           else
//             print('스냅샷 데이터 가져오는 중 ${snapshot.data}');
//           if (!snapshot.hasData) {
//             // return Text('No data');
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           // final item = RestaurantDetailModel.fromJson(
//           //   json: snapshot.data!,
//           // );
//           return CustomScrollView(
//             slivers: [
//               // renderTop(model: snapshot.data),
//               renderLabel(),
//               // renderProducts(food: item.food),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Future<Map<String, dynamic>> getRestaurantDetail() async {
//   //   final resp = await client.from('food').select().eq('store_id', id);
//   //   // final resp = await client.from('store').select('*,food(*)').eq('id', id);
//   //   print('resp 는 $resp');
//   //   return resp;
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   return DefaultLayout(
//   //     title: '반미에 반하다',
//   //     child: FutureBuilder<Map<String, dynamic>>(
//   //       future: getRestaurantDetail(),
//   //       builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.done)
//   //           print('스냅샷 데이터완료 ${snapshot.data}');
//   //         else if (snapshot.connectionState == ConnectionState.none)
//   //           print('스냅샷 데이터 시작 ${snapshot.data}');
//   //         else
//   //           print('스냅샷 데이터 가져오는 중 ${snapshot.data}');
//   //         if (!snapshot.hasData) {
//   //           // return Text('No data');
//   //           return Center(
//   //             child: CircularProgressIndicator(),
//   //           );
//   //         }
//   //
//   //         final item = RestaurantDetailModel.fromJson(
//   //           json: snapshot.data!,
//   //         );
//   //         return CustomScrollView(
//   //           slivers: [
//   //             renderTop(model: snapshot.data),
//   //             renderLabel(),
//   //             renderProducts(food: item.food),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
//
//   SliverPadding renderLabel() {
//     return SliverPadding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       sliver: SliverToBoxAdapter(
//         child: Text(
//           '메뉴',
//           style: TextStyle(
//             fontSize: 18.0,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
//
//   SliverPadding renderProducts({
//     required List<RestaurantFoodModel> food,
//   }) {
//     return SliverPadding(
//       padding: EdgeInsets.symmetric(horizontal: 16.0),
//       sliver: SliverList(
//         delegate: SliverChildBuilderDelegate(
//           (context, index) {
//             final model = food[index];
//             // final pItem = RestaurantDetailModel.fromJson(json: data);
//             return Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: ProductCard.fromModel(
//                 model: model,
//               ),
//             );
//           },
//           childCount: food.length,
//         ),
//       ),
//     );
//   }
//
//   SliverToBoxAdapter renderTop({required dynamic model}) {
//     print('item? $model');
//
//     // <dynamic>형식일때 사용---------
//     final newitem = RestaurantModel.fromJson(model);
//     print('newitem? $newitem');
//     // final pItem = RestaurantModel.fromJson(json: item);
//     // print('pItem? $pItem');
//     //-----------------------------
//
//     return SliverToBoxAdapter(
//       child: RestaurantCard.fromModel(
//         model: newitem,
//         isDetail: true,
//       ),
//     );
//   }
// }
