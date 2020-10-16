import 'package:flutter/cupertino.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final Color primaryColor;
  final Color secondaryColor;

  const GradientBackground(
      {this.child, this.primaryColor, this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Globals.windowSize.width,
        height: Globals.windowSize.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
              primaryColor == null
                  ? Color.fromRGBO(199, 59, 35, 1)
                  : primaryColor,
              secondaryColor == null
                  ? Color.fromRGBO(61, 1, 78, 1)
                  : secondaryColor,
            ])),
        child: child ?? Container());
  }
}
