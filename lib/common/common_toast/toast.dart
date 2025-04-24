import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  final String message;
  final ToastGravity gravity;
  final Toast toastLength;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final int timeInSecForIosWeb;

  CommonToast({
    required this.message,
    this.gravity = ToastGravity.BOTTOM,
    this.toastLength = Toast.LENGTH_SHORT,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
    this.timeInSecForIosWeb = 1,
  });

  void showToast() {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
