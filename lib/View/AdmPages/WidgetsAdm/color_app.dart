import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorApp extends StatelessWidget {
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
            child: GradientBackground(),
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
                  color: Color.fromRGBO(199, 59, 35, 1),
                ),
                SizedBox(
                  width: 16,
                ),
                Text('Cor Primária'),
              ],
            ),
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Cor Primária'),
                      content: MaterialColorPicker(
                          onColorChange: (Color color) {
                            // Handle color changes
                          },
                          selectedColor: Colors.orange),
                      actions: [
                        FlatButton(
                          child: Text('Cancelar'),
                          onPressed: () => null,
                        ),
                        FlatButton(
                          child: Text('Enviar'),
                          onPressed: () => null,
                        ),
                      ],
                    )),
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
                  color: Color.fromRGBO(61, 1, 78, 1),
                ),
                SizedBox(
                  width: 16,
                ),
                Text('Cor Secundária'),
              ],
            ),
            onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Cor Secundária'),
                      content: MaterialColorPicker(
                          onColorChange: (Color color) {
                            // Handle color changes
                          },
                          selectedColor: Colors.purple[900]),
                      actions: [
                        FlatButton(
                          child: Text('Cancelar'),
                          onPressed: () => null,
                        ),
                        FlatButton(
                          child: Text('Enviar'),
                          onPressed: () => null,
                        ),
                      ],
                    )),
          ),
        ],
      ),
    );
  }
}
