import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/PerfilController.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/TempoPerfil.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/UsuarioLabel.dart';
import 'package:megaponto_oficial/View/Utils/TranformaTempo.dart';

import 'tela_editar_perfil.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        UsuarioLabel(),
        TempoPerfil()
      ],
    );
  }


}
