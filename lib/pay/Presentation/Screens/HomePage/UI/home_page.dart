import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../Compomemts/sliding_panel.dart';
import '../Widgets/first_view.dart';
import '../Widgets/first_view_cta.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PanelController slideAController;

  @override
  void initState() {
    slideAController = PanelController();
    super.initState();
  }

  @override
  void dispose() {
    slideAController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildInitialLayout(),
    );
  }

  Widget buildInitialLayout() => Center(
        child: Stack(
          children: <Widget>[
            const FirstView(),
            SlidingPanelBldr(
              ctaWidget: FirstViewCTA(
                  panelController: slideAController,
                  ctaText: 'Enter Card Details'),
              panelWidget: const SizedBox(),
              panelController: slideAController,
              minHeight: 75,
              maxHeightSub: 230,
              opacityFactor: 0.15,
            ),
          ],
        ),
      );
}
