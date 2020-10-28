import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class EstadoSalaDialog extends StatelessWidget {
  final EstadoSalaEnum estadoSala;
  final Function onTap;

  EstadoSalaDialog({@required this.estadoSala, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AlertDialog(
        actions: <Widget>[
          Container(
            height: Globals.windowSize.height * 0.1,
            width: Globals.windowSize.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Icon(
                    estadoSala.icon,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        estadoSala.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        estadoSala.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
