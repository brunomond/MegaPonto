import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorApp extends StatefulWidget {
  @override
  _ColorAppState createState() => _ColorAppState();
}

class _ColorAppState extends State<ColorApp> {
  // create some values
  Color pickerFirstColor = Color.fromRGBO(199, 59, 35, 1);
  Color currentFirstColor = Color.fromRGBO(199, 59, 35, 1);
  Color pickerSecondColor = Color.fromRGBO(61, 1, 78, 1);
  Color currentSecondColor = Color.fromRGBO(61, 1, 78, 1);

  // ValueChanged<Color> callback
  void changeFirstColor(Color color) {
    setState(() => pickerFirstColor = color);
  }

  void changeSecondColor(Color color) {
    setState(() => pickerSecondColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //Mostra Gradiente das cores escolhidas
            height: 64,
            child: GradientBackground(
              primaryColor: pickerFirstColor,
              secondaryColor: pickerSecondColor,
            ),
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.transparent,
          ),
          GestureDetector(
            child: Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  color: pickerFirstColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text('Cor Primária'),
              ],
            ),
            onTap: () => showDialog(
              context: context,
              child: AlertDialog(
                title: const Text('Pick a color!'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: pickerFirstColor,
                    onColorChanged: changeFirstColor,
                    showLabel: true,
                    pickerAreaHeightPercent: 0.8,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('Got it'),
                    onPressed: () {
                      setState(() => currentFirstColor = pickerFirstColor);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.transparent,
          ),
          GestureDetector(
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    color: pickerSecondColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text('Cor Secundária'),
                ],
              ),
              onTap: () => showDialog(
                    context: context,
                    child: AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerSecondColor,
                          onColorChanged: changeSecondColor,
                          showLabel: true,
                          pickerAreaHeightPercent: 0.8,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Got it'),
                          onPressed: () {
                            setState(
                                () => currentSecondColor = pickerSecondColor);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
