import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Globals.windowSize.height * 0.15,
      child: Center(
        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Globals.theme.primaryColor),),
      ),
    );
  }
}
