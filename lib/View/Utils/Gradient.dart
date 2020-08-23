
import 'package:flutter/cupertino.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class GradientBackground extends StatelessWidget {
 
 final Widget child;
  const GradientBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
          width: Globals.windowSize.width,
          height: Globals.windowSize.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [
                Color.fromRGBO(61, 1, 78, 1),
                Color.fromRGBO(199, 59, 35, 1)
              ])),
          child: child ?? Container()
          );
  }
}
