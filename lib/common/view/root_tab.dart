import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '맛있달',
      child: Center(
        child: Text('Root Tab'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          setState(() {
            this.index = index;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
        ],
      ),
    );
  }
}
