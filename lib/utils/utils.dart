import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static generateColors() {
    var colors = [
      Colors.blue,
      Colors.redAccent,
      Colors.green,
      Colors.orange,
    ];

    return colors[Random().nextInt(colors.length)];
  }
}

extension Precision on double {
  double toPrecision(int fractionDigits) {
    var mod = pow(10, fractionDigits.toDouble()).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}
