import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';

class ColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: GradientBackground(),
        ),
        //Row(),
        //Row(),
      ],
    );
  }
}
