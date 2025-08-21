import 'package:flutter/material.dart';

class EnterAnimation {
  AnimationController cntrlr;
  late Animation<double> circleSize;

  EnterAnimation(this.cntrlr) {
    circleSize = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: cntrlr, curve: Curves.easeInBack));
  }
}
