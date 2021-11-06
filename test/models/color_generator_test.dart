import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_solid_software/models/color_generator.dart';

void main() {
  group('ColorGenerator.randomColor', () {
    for (int i = 0; i < 10; i++) {
      test('opacity should be 1', () {
        expect(Color(ColorGenerator.randomColor()).opacity, 1);
      });
    }
  });

  group('ColorGenerator.contrastWBColor', () {
    const func = ColorGenerator.contrastBrightness;
    const dark = Brightness.dark;
    const light = Brightness.light;

    test('on white should return black color', () {
      expect(func(Colors.white.value), dark);
    });
    test('on yellow should return black color', () {
      expect(func(Colors.yellow.value), dark);
    });
    test('on lime should return black color', () {
      expect(func(Colors.lime.value), dark);
    });
    test('on black should return white color', () {
      expect(func(Colors.black.value), light);
    });
    test('on blue should return white color', () {
      expect(func(Colors.blue.value), light);
    });
    test('on green should return white color', () {
      expect(func(Colors.green.value), light);
    });
  });
}
