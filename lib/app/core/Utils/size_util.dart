import 'package:flutter/material.dart';

class SizeUtil {
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
