import 'package:flutter/material.dart';
import '../../../Declarations/constants.dart';

class HelpIcons extends StatelessWidget {
  const HelpIcons({Key? key, required this.icon}) : super(key: key);

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
