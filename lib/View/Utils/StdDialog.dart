import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class StdDialog extends StatelessWidget {
  final String title;
  final String contentText;
  final Map<String, Function> options;

  StdDialog({this.title, this.contentText, this.options});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: title != null ? Text(title) : null,
        backgroundColor: Globals.theme.primaryColor,
        elevation: 8,
        content: Text(
          contentText,
          textAlign: TextAlign.justify,
        ),
        actions: _optionSelector(options));
  }

  List<Widget> _optionSelector(Map<String, Function> options) {
    List<Widget> actions = new List<Widget>();
    options.forEach((key, value) {
      actions.add(new FlatButton(
        child: Text(key,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.normal)),
        onPressed: () => value(),
      ));
    });
    return actions;
  }
}
