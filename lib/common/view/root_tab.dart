import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:deliciousdal/call/call.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/order/view/map_screen.dart';
import 'package:deliciousdal/restaurant/view/restaurant_screen.dart';
import 'package:deliciousdal/screen/main_page.dart';
import 'package:deliciousdal/user/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/colors.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  final GlobalKey<AnimatedFloatingActionButtonState> key =
      GlobalKey<AnimatedFloatingActionButtonState>();
  int index = 0;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);

    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);

    super.dispose();
  }

  void tabListener() {
    if (mounted) {
      setState(() {
        index = controller.index;
      });
    }
  }

  Widget Chatroom() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => MainPage(),
            ),
          );
        },
        heroTag: "Chatroom",
        tooltip: 'Chatroom',
        child: Icon(Icons.question_answer_outlined),
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }

  Widget Call() {
    return Container(
      child: FloatingActionButton(
        onPressed: CallScreen,
        heroTag: "Call",
        tooltip: 'Call',
        child: Icon(Icons.headset_mic),
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '맛있달',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          RestaurantScreen(),
          Container(child: Container(child: Text('음식'))),
          MapScreen(),
          ProfileScreen(),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: [
          Chatroom(),
          Call(),
        ],
        key: key,
        colorStartAnimation: PRIMARY_COLOR,
        colorEndAnimation: SECOND_COLOR,
        animatedIconData: AnimatedIcons.menu_close,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'My',
          ),
        ],
      ),
    );
  }
}
