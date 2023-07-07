import 'dart:math' as math;

import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double screenDiagonal;

  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double blockSizeDiagonal;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    screenDiagonal =
        math.sqrt(math.pow(screenWidth, 2) + math.pow(screenHeight, 2));

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    blockSizeDiagonal = screenDiagonal / 100;
  }
}
