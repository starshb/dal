import 'package:deliciousdal/common/const/colors.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
class OrderMap extends StatefulWidget {
  const OrderMap({super.key});

  @override
  State<OrderMap> createState() => _OrderMapState();
}

class _OrderMapState extends State<OrderMap> {
  late KakaoMapController mapController;
  bool isOrderCancel = false;

  bool isDefaultMap = true;
  int currentLevel = 0;

  Set<Marker> markers = {};

  Future setBool() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    isOrderCancel = true;
    await pre.setBool('isOrderCancel', true);
  }

  Future getBool() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    final bool? repeat = pre.getBool('isOrderCancel');
    return repeat;
  }

  @override
  void initState() {
    super.initState();
    getBool();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3 * 1, //기기의 1/3 크기로 지정
            child: KakaoMap(
              onMapCreated: ((controller) async {
                mapController = controller;

                currentLevel = await mapController.getLevel();

                markers.add(
                  Marker(
                    markerId: UniqueKey().toString(),
                    latLng: await mapController.getCenter(),
                  ),
                );

                setState(() {});
              }),
              markers: markers.toList(),
              center: LatLng(37.500166, 127.029069),
              // Stack(
              //   children: [

              //y(위도), x(경도)
              // mapTypeControl: true,
              // mapTypeControlPosition: ControlPosition.topRight,
              // zoomControl: true,
              // zoomControlPosition: ControlPosition.right,
            ),
            // ],
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _TextChange(
                  txt: isOrderCancel ? '주문이 취소되었습니다.' : '매장에서 주문을 확인중입니다.',
                ),
                ElevatedButton(
                  onPressed: () {
                    setBool();
                    setState(() {});
                  },
                  child: _TextChange(
                    txt: isOrderCancel ? '주문취소됨' : '주문취소',
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                ),
                _TextChange(
                    txt: isOrderCancel ? '' : '매장이 조리를 시작하면 취소할 수 없습니다.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextChange extends StatelessWidget {
  String txt;
  Color? color;
  _TextChange({required this.txt, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        txt,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: color,
        ),
      ),
    );
  }
}
