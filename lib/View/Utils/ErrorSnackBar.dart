import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {
  final String errorText;

  ErrorSnackBar({@required this.errorText})
      : super(
          content: Text(
            errorText,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontFamily: 'Segoe UI'),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        );
}
