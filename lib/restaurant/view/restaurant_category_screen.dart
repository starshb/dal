import 'package:deliciousdal/common/const/data.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RestaurantCategoryScreen extends StatelessWidget {
  const RestaurantCategoryScreen({super.key});

  Future<dynamic> getCategory() async {
    final resp = await client.from('category').select().order(
          'num',
          ascending: true,
        );
    print('resp는 $resp');
    print(resp.length);
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    // readSt();
    // readData();
    return Column(
      children: [
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder<dynamic>(
                future: getCategory(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: CircularProgressIndicator(),
                      // child: Text('No More Data'),
                    );
                  }
                  return GridView.builder(
                      shrinkWrap: true, //column의 무한 확장 에러 방지
                      itemCount: snapshot.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (_, index) {
                        final item = snapshot.data[index];
                        return Container(
                          child: Center(
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      });

                  // return ListView.separated(
                  //     itemCount: snapshot.data!.length,
                  //     itemBuilder: (_, index) {
                  //       final item = snapshot.data![index];
                  //       final pItem = RestaurantModel.fromJson(
                  //         item,
                  //       );
                  //
                  //       return GestureDetector(
                  //         onTap: () {
                  //           Navigator.of(context).push(
                  //             MaterialPageRoute(
                  //               builder: (_) => RestaurantDetailScreen(
                  //                 id: pItem.id,
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //         child: RestaurantCard.fromModel(
                  //           model: pItem,
                  //         ),
                  //       );
                  //     },
                  //     separatorBuilder: (_, index) {
                  //       return SizedBox(
                  //         height: 16.0,
                  //       );
                  //     });
                  // print(snapshot.error);
                  // print(snapshot.data);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final resp = getCategory();
  //   return const DefaultLayout(
  //     child: Column(
  //       children: [
  //         FutureBuilder(
  //           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {},
  //           child: GridView.builder(
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 5,
  //               childAspectRatio: 1,
  //               crossAxisSpacing: 10,
  //               mainAxisSpacing: 10,
  //             ),
  //             itemCount: resp.length,
  //             itemBuilder: (
  //               BuildContext context,
  //             ) {
  //               return Container();
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
