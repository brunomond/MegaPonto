import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';

class NameFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          OutlineButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/adm_nomenclatura'),
              child: Text('Editar Cargos')),
          OutlineButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/adm_nomenclatura'),
              child: Text('Editar Patentes'))
        ],
      ),
    );
  }
}
