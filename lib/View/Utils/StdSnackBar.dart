import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class StdSnackBar extends SnackBar {
  final String text;
  final Duration duration;

  StdSnackBar({@required this.text, this.duration = const Duration(seconds: 2)})
      : super(
          content: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'Segoe UI'),
          ),
          duration: duration,
          backgroundColor: Globals.theme.primaryColor,
        );
}
