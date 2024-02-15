import 'package:flutter/material.dart';

class S {
  static SizedBox h(double height) {
    return SizedBox(height: height);
  }

  static SizedBox shrink() {
    return const SizedBox.shrink();
  }

  static SizedBox w(double width, [BuildContext? context]) {
    return SizedBox(width: width);
  }
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
