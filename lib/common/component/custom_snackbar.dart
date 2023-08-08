import 'package:deliciousdal/common/const/colors.dart';
import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: BODY_TEXT_COLOR,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
