import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
class InfoPlantao extends StatelessWidget {

  final String title;
  final String label;
  final String buttonLabel;
  final Function onPressed;
  InfoPlantao({@required this.title, this.label, this.buttonLabel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              label != null ? Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  label,
                  style: Globals.textTheme.headline6,
                ),
              ) : null,
              Text(
                title,
                style: Globals.textTheme.headline5,
              ),
              StdButton(padding: EdgeInsets.all(8),label: buttonLabel, onPressed: onPressed, width: 200, height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}
