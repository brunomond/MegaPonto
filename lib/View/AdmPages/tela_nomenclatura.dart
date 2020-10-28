import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class EditarNomenclatura extends StatefulWidget {
  @override
  _EditarNomenclaturaState createState() => _EditarNomenclaturaState();
}

class _EditarNomenclaturaState extends State<EditarNomenclatura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      body: SingleChildScrollView(
          child: ListBody(
        children: [
          Text('Cargos'),
          Row(
            children: [
              StdTextInput(
                hintText: 'Cargo 1',
              ),
            ],
          ),
        ],
      )),
    );
  }
}
