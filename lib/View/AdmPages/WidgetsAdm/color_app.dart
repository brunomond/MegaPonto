import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';

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
            height: 32,
            child: GradientBackground(),
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.transparent,
          ),
          Row(
            children: [
              GestureDetector(
                child: Container(
                  height: 32,
                  width: 32,
                  color: Color.fromRGBO(199, 59, 35, 1),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text('Cor Primária'),
            ],
          ),
          Divider(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.transparent,
          ),
          Row(
            children: [
              GestureDetector(
                child: Container(
                  height: 32,
                  width: 32,
                  color: Color.fromRGBO(61, 1, 78, 1),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text('Cor Secundária'),
            ],
          ),
        ],
      ),
    );
  }
}
