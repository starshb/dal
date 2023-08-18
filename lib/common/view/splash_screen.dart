// import 'dart:js_interop';

import 'package:deliciousdal/common/const/colors.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/common/view/root_tab.dart';
import 'package:deliciousdal/user/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../const/data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // deleteToken();
    // checkToken();
    checkCurrentUser();
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  void checkCurrentUser() async {
    final User? user = client.auth.currentUser;
    print("user는 $user");
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
          (route) => false,
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => RootTab(),
          ),
          (route) => false,
        );
      });
    }
  }

  // void checkToken() async {
  //   final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
  //   final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
  //
  //   final dio = Dio();
  //
  //   try {
  //     final resp = await dio.post(
  //       'http://$ip/auth/token',
  //       options: Options(
  //         headers: {
  //           'authorization': 'Bearer $refreshToken ',
  //         },
  //       ),
  //     );
  //     await storage.write(
  //         key: ACCESS_TOKEN_KEY, value: resp.data['accessToken']);
  //
  //     Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(
  //         builder: (_) => RootTab(),
  //       ),
  //       (route) => false,
  //     );
  //   } catch (e) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(
  //         builder: (_) => LoginScreen(),
  //       ),
  //       (route) => false,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: MediaQuery.of(context).size.width / 4,
            ),
            SizedBox(
              height: 16.0,
            ),
            CircularProgressIndicator(
              color: PRIMARY_COLOR,
            ),
          ],
        ),
      ),
    );
  }
}
