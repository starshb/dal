import 'package:deliciousdal/user/view/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../Declarations/constants.dart';

class HelpIcons extends StatelessWidget {
  HelpIcons({Key? key, required this.isBack, required this.icon})
      : super(key: key);
  bool isBack = false; // 도움말과 뒤로가기 버튼 구별 위함
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: secondaryColor.withOpacity(0.3),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }
}
