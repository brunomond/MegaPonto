import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class Loading extends StatelessWidget {
  final Color color;

  Loading({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Globals.windowSize.height * 0.15,
      child: Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(color ?? Globals.theme.primaryColor),),
      ),
    );
  }
}
