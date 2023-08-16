import 'package:deliciousdal/common/const/data.dart';
import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

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
                  )
                ],
              );
            },
          ),
          // Text(
          //   getMy() as String,
          // ),
        ],
      ),
    );
  }
}
