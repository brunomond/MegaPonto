import 'package:flutter/material.dart';


class PontoScrollPhysics extends ScrollPhysics {

  @override
  ScrollPhysics applyTo(ScrollPhysics ancestor) {
    return PontoScrollPhysics();
  }

@override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    
    if(offset > 0 && position.axisDirection != AxisDirection.left && position.axisDirection != AxisDirection.right) return 2;
    return 0;

  }
}