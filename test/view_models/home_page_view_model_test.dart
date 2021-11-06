import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_solid_software/models/color_generator.dart';
import 'package:test_task_solid_software/view_models/home_page_view_model.dart';

void main() {
  group('HomePageViewModel init:', () {
    test('backgroundColor & textColor should not be null', () {
      final model = HomePageViewModel();
      expect(
          model.getBackgroundColor != null &&
              model.getForegroundBrightness != null,
          true);
    });

    test('should have black background and light brightness', () {
      final model = HomePageViewModel(backgroundColor: Colors.black.value);
      expect(
          model.getBackgroundColor == Colors.black.value &&
              model.getForegroundBrightness == Brightness.light,
          true);
    });

    test('should have lime background and dark brightness', () {
      final model = HomePageViewModel(backgroundColor: Colors.lime.value);
      expect(
          model.getBackgroundColor == Colors.lime.value &&
              model.getForegroundBrightness == Brightness.dark,
          true);
    });

    test('should have white background and dark brightness', () {
      final model = HomePageViewModel(backgroundColor: Colors.white.value);
      expect(
          model.getBackgroundColor == Colors.white.value &&
              model.getForegroundBrightness == Brightness.dark,
          true);
    });
  });

  group('HomePageViewModel.onTapAnywhere:', () {
    for (int i = 0; i < 10; i++) {
      test('background color should change', () {
        final model = HomePageViewModel();
        final prevColor = model.getBackgroundColor;
        model.onTapAnywhere();
        expect(prevColor != model.getBackgroundColor, true);
      });
    }

    for (int i = 0; i < 10; i++) {
      test('background & text colors shoud be contrast', () {
        final model = HomePageViewModel();
        expect(
            model.getForegroundBrightness ==
                ColorGenerator.contrastBrightness(model.getBackgroundColor),
            true);
      });
    }
  });
}
