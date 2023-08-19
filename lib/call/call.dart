import 'package:deliciousdal/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void CallScreen() async {
  Uri phoneno = Uri.parse('tel:02-736-1234');
  if (await launchUrl(phoneno)) {
    //dialer opened
  } else {
    //dailer is not opened
  }
}
