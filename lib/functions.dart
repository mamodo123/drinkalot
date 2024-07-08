import 'package:flutter/material.dart';

Color darkenColor(Color color, double amount) {
  final hsl = HSLColor.fromColor(color);
  final darkerHsl = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return darkerHsl.toColor();
}