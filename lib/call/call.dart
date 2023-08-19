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
