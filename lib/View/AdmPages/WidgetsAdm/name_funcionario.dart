import 'package:flutter/material.dart';

class NameFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          OutlineButton(
              onPressed: () => Navigator.pushNamed(context, '/adm_app'),
              child: Text('Editar Cargos')),
          OutlineButton(
              onPressed: () => Navigator.pushNamed(context, '/adm_app'),
              child: Text('Editar Patentes'))
        ],
      ),
    );
  }
}
