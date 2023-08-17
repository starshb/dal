import 'package:deliciousdal/common/const/colors.dart';
import 'package:deliciousdal/common/const/data.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:deliciousdal/user/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:deliciousdal/common/const/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<String> getMy() async {
    final user = client.auth.currentUser;
    final name = user!.userMetadata!['nickname'];
    // print("user는 ${user?.userMetadata?['username']}");
    return name;
  }

  @override
  Widget build(BuildContext context) {
    getMy();
    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            FutureBuilder(
              future: getMy(),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${snapshot.data} 님',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('보안인증'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await client.auth.signOut();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (_) => LoginScreen(),
                            ),
                            (route) => false);
                      },
                      child: Text('로그아웃'),
                      style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty<Color>,
                          ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
