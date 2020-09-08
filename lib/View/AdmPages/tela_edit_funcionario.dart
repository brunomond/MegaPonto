import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/MembrosCard.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/BottomApp.dart';
import 'package:megaponto_oficial/Model/usuario.dart';

class EditarFuncionario extends StatelessWidget {
  List<Usuario> listFuncionarios = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      //body: MembrosCRUD,
      bottomNavigationBar: BottomApp(
        index: 4,
      ),
    );
  }
}
