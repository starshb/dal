import 'package:deliciousdal/common/component/custom_text_form_field.dart';
import 'package:deliciousdal/common/view/splash_screen.dart';
import 'package:deliciousdal/user/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    _App(),
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Nanum',
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
