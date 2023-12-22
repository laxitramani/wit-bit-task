import 'package:flutter/material.dart';
import 'package:wit_by_bit/utils/colors.dart';
import 'package:wit_by_bit/utils/size_config.dart';

class AppTextStyle {
  static TextStyle normalTextStyle({
    double fontSize = 14,
    Color color = AppColors.color888888,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.setHeight(),
      fontWeight: FontWeight.w400,
      fontFamily: "Futura",
    );
  }

  static TextStyle heavyTextStyle({
    double fontSize = 14,
    Color color = AppColors.color333333,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.setHeight(),
      fontWeight: FontWeight.w700,
      fontFamily: "Futura",
    );
  }

  static TextStyle smallTextStyle({
    double fontSize = 14,
    Color color = AppColors.color888888,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.setHeight(),
      fontWeight: FontWeight.w200,
      fontFamily: "Futura",
    );
  }
}
