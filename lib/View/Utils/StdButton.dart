import 'package:flutter/material.dart';

class StdButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final EdgeInsets padding;

  StdButton(
      {Key key, @required this.label, @required this.onPressed, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width * 0.5,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: SizedBox.expand(
          child: FlatButton(
            onPressed: () => onPressed(),
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
