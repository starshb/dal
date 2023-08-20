import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../Declarations/constants.dart';

class SlidingCTA extends StatelessWidget {
  const SlidingCTA(
      {Key? key,
      required this.panelController,
      required this.ctaText,
      required this.opacityFactor})
      : super(key: key);

  final PanelController panelController;
  final String ctaText;
  final double opacityFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor.withOpacity(opacityFactor),
      child: GestureDetector(
        onTap: () {
          panelController.open();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: secondaryColor.withBlue(200),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: kPadding,
              child: Text(
                ctaText,
                style: TextStyle(color: Colors.white, fontSize: kfontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
