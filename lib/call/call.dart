import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void CallScreen() async {
  Uri phoneno = Uri.parse('tel:+8201012345678');
  if (await launchUrl(phoneno)) {
    //dialer opened
  } else {
    //dailer is not opened
  }
}

// class CallScreen extends StatefulWidget {
//   const CallScreen({super.key});
//
//   @override
//   State<CallScreen> createState() => _CallScreenState();
// }
//
// class _CallScreenState extends State<CallScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultLayout(
//       title: 'Call',
//       child: Container(
//         padding: EdgeInsets.only(top: 20, left: 20, right: 20),
//         alignment: Alignment.topCenter,
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () async {
//                   Uri phoneno = Uri.parse('tel:+8201012345678');
//                   if (await launchUrl(phoneno)) {
//                     //dialer opened
//                   } else {
//                     //dailer is not opened
//                   }
//                 },
//                 child: Text("Call Us Now"))
//           ],
//         ),
//       ),
//     );
//   }
// }
