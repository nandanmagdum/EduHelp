import 'package:flutter/material.dart';

void showSnakBar(
    BuildContext context, String content, int duration, bool isScuccess) {
  final snackBar = SnackBar(
    content: Text(content),
    duration: Duration(seconds: duration),
    backgroundColor: isScuccess ? Colors.green : Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
