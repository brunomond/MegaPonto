import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_nomenclatura.dart';

class NameFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          OutlineButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EditarNomenclatura())),
              child: Text('Editar Cargos')),
          OutlineButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EditarNomenclatura())),
              child: Text('Editar Patentes'))
        ],
      ),
    );
  }
}
