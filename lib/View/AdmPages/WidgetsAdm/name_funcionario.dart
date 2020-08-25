import 'package:flutter/material.dart';

class NameFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            //Editar Cargos
            child: SizedBox(
              child: Text('Editar Cargos'),
            ),
          ),
          OutlineButton(onPressed: null, child: Text('Editar Patentes'))
        ],
      ),
    );
  }
}
