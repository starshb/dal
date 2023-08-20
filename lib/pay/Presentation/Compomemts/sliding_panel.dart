import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../Declarations/constants.dart';

class SlidingPanelBldr extends StatelessWidget {
  const SlidingPanelBldr(
      {Key? key,
      required this.panelWidget,
      required this.ctaWidget,
      required this.panelController,
      required this.minHeight,
      required this.maxHeightSub,
      required this.opacityFactor})
      : super(key: key);

  final Widget panelWidget;
  final Widget ctaWidget;
  final PanelController panelController;
  final double minHeight;
  final double maxHeightSub;
  final double opacityFactor;
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panelController,
      minHeight: minHeight,
      maxHeight: MediaQuery.of(context).size.height - maxHeightSub,
      margin: EdgeInsets.zero,
      collapsed: ctaWidget,
      panel: panelWidget,
      color: primaryColor.withOpacity(opacityFactor),
    );
  }
}
