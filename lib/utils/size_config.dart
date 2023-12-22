import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }
}

extension DynamicSize on num {
// Get the proportionate height as per screen size
  double setHeight() {
    // 812 is the layout height that designer use
    return (this / 812) * SizeConfig.screenHeight;
  }

// Get the proportionate height as per screen size
  double setWidth() {
    // 375 is the layout width that designer use
    return (this / 375) * SizeConfig.screenWidth;
  }
}

Widget sizeBoxHeight(double value) {
  return SizedBox(height: value.setHeight());
}

Widget sizeBoxWidth(double value) {
  return SizedBox(width: value.setWidth());
}
