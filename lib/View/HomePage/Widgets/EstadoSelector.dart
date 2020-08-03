import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
class EstadoSelector extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function onTap;
  final EdgeInsets padding;

  EstadoSelector({@required this.icon, @required this.text, @required this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  size: 30,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  text,
                  style: Globals.textTheme.headline6
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.expand_more,
                  size: 32,
                ),
              )
            ]),
      ),
    );
  }
}
