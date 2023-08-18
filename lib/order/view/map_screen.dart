import 'package:deliciousdal/common/const/colors.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late KakaoMapController mapController;
  bool isOrderCancel = false;

  bool isDefaultMap = true;
  int currentLevel = 0;

  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3 * 1, //기기의 1/3 크기로 지정
            child:
                // Stack(
                //   children: [
                KakaoMap(
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
                OutlinedButton(
                  onPressed: () {
                    isOrderCancel = true;
                  },
                  child: _TextChange(
                    txt: isOrderCancel ? '주문취소됨' : '주문취소',
                  ),
                ),
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

  _TextChange({required this.txt, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        txt,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    );
  }
}
