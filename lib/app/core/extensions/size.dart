import 'package:flutter/material.dart';

extension SizeResponsiveExtension on Size {
  double responsive(double value) {
    if (width < 600) {
      return (value / MockupDimension.mobileDimension.width) * width;
    } else {
      return (value / MockupDimension.webDimension.height) * height;
    }
  }
}

class MockupDimension {
  static const mobileDimension = Size(375, 667);
  static const webDimension = Size(1440, 1024);
}
