import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import '../../../../Models/card_model.dart';
import '../../../Compomemts/spacer.dart';
import '../../../Declarations/constants.dart';
import 'help_icon.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Column(
        children: [
          HeightSpacer(myHeight: kSpacing * 2),
          Padding(
            padding: kPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HelpIcons(icon: Icons.close),
                HelpIcons(icon: Icons.help_outline)
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: kBorderRadius,
                color: secondaryColor.withOpacity(0.15),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: kPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeightSpacer(myHeight: kSpacing),
                    Text('Credit Card package',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kfontSize,
                        )),
                    HeightSpacer(myHeight: kSpacing / 2),
                    Text(
                        'A Credit Card widget package, support entering card details, card flip animation.',
                        style: TextStyle(color: accentColor)),
                    HeightSpacer(myHeight: kSpacing * 2),

                    //---Credit Card Widget Starts---
                    CreditCardWidget(
                      glassmorphismConfig: Glassmorphism.defaultConfig(),
                      cardNumber: listData[0].cardNumber,
                      expiryDate: listData[0].expiryDate,
                      cardHolderName: listData[0].cardHolderName,
                      cvvCode: listData[0].cvvCode,
                      showBackView: listData[0].showBackView,
                      onCreditCardWidgetChange: (data) {
                        debugPrint('Branch Name: ${data.brandName}');
                      },
                    ),
                    //---Credit Card Widget Ends---

                    HeightSpacer(myHeight: kSpacing / 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
