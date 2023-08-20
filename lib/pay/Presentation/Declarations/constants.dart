import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff161922);
Color secondaryColor = const Color(0xff3b479b);
Color accentColor = Colors.grey;

double kSpacing = 20.00;

double kfontSize = 18.00;
double kLargefontSize = 25.00;

BorderRadius kBorderRadius = BorderRadius.circular(kSpacing);

EdgeInsets kPadding = EdgeInsets.all(kSpacing);

EdgeInsets kHPadding = EdgeInsets.symmetric(horizontal: kSpacing);
EdgeInsets kVPadding = EdgeInsets.symmetric(vertical: kSpacing);

getBtnStyle(context) => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
    fixedSize: Size(MediaQuery.of(context).size.width, 47),
    primary: primaryColor,
    textStyle: const TextStyle(fontWeight: FontWeight.bold));

var btnTextStyle = TextStyle(fontSize: kfontSize);
