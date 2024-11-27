import 'package:edu_help/constants/constants.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? customAppBar() {
  return AppBar(
    backgroundColor: Constants.color1,
    centerTitle: true,
    title: Text(
      "EduHelp",
      style: TextStyle(color: Constants.textColor2),
    ),
  );
}
