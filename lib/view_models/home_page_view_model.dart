import 'package:flutter/material.dart';
import 'package:test_task_solid_software/models/color_generator.dart';

class HomePageViewModel with ChangeNotifier {
  late int _backgroundColor;
  late Brightness _foregroundBrightness;

  get getBackgroundColor => _backgroundColor;
  get getForegroundBrightness => _foregroundBrightness;

  HomePageViewModel({int? backgroundColor}) : super() {
    _backgroundColor = backgroundColor ?? ColorGenerator.randomColor();
    _foregroundBrightness = ColorGenerator.contrastBrightness(_backgroundColor);
  }

  void onTapAnywhere() {
    _backgroundColor = ColorGenerator.randomColor();
    _foregroundBrightness = ColorGenerator.contrastBrightness(_backgroundColor);
    notifyListeners();
  }
}
