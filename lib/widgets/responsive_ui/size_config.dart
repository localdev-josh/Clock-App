import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static double widthMultiply(double numberSize) {
    return (numberSize / (_screenWidth / 100)) * widthMultiplier;
  }

  static double heightMultiply(double numberSize) {
    return (numberSize / (_screenHeight / 100)) * heightMultiplier;
  }

  static double textMultiply(double numberSize) {
    return (numberSize / (_screenHeight / 100)) * textMultiplier;
  }

  static double imageMultiply(double numberSize) {
    return (numberSize / (_screenWidth / 100)) * imageSizeMultiplier;
  }

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;


    print("Height");
    print(_blockHeight);
    print("width");
    print(_blockWidth);
  }
}
