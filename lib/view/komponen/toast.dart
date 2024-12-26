import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void customToast(String massage, Color color) {
  Fluttertoast.showToast(
    msg: massage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    backgroundColor: color,
    textColor: Colors.white,
    timeInSecForIosWeb: 3,
    fontSize: 15.0,
  );
}
