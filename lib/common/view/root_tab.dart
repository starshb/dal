import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:deliciousdal/chatbot/chat_send.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

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

  Widget Chatbot() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChatSend(),
            ),
          );
        },
        heroTag: "Chatbot",
        tooltip: 'Chatbot',
        child: Icon(
          Icons.question_mark_outlined,
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }

  Widget Chatroom() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
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
        onPressed: null,
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
          Container(child: Container(child: Text('주문'))),
          Container(child: Container(child: Text('프로필'))),
        ],
      ),
      floatingActionButton: AnimatedFloatingActionButton(
        fabButtons: [
          Chatbot(),
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
