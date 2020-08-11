import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class StdButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final EdgeInsets padding;
  final double height;
  final double width;

  StdButton(
      {Key key, @required this.label, @required this.onPressed, this.padding, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 8),
      child: Container(
        height: height ?? 50,
        width: width ?? Globals.windowSize.width * 0.45,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: onPressed != null ? Theme.of(context).primaryColor : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: SizedBox.expand(
          child: FlatButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  label,
                  style: Theme.of(context).textTheme.button,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
