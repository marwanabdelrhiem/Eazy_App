import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class AppPopUp {
  static showToast(String message,Color background) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // أو Toast.LENGTH_LONG
      gravity: ToastGravity.BOTTOM,
      backgroundColor: background,// مكان التوست (TOP, CENTER, BOTTOM)
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
