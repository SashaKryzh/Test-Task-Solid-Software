import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerator {
  static int randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0)
        .value;
  }

  static Brightness contrastBrightness(int value) {
    final color = Color(value);
    final brightness =
        (color.red * 0.299 + color.green * 0.587 + color.blue * 0.114) > 186
            ? Brightness.dark
            : Brightness.light;
    return brightness;
  }
}
