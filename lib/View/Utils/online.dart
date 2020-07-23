import 'package:flutter/material.dart';

class Online extends StatelessWidget {
  final bool online;
  final double width;
  final double heigth;
  const Online({Key key, this.online, this.width, this.heigth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return online
        ? Container(
            width: width,
            height: heigth,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 255, 0, 1),
              shape: BoxShape.circle,
            ),
          )
        : Container(
            width: width,
            height: heigth,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          );
  }
}
