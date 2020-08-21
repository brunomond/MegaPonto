import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/BottomApp.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';

class EditarFuncionario extends StatelessWidget {
  List<Usuario> listFuncionarios = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      //body: ,
      bottomNavigationBar: BottomApp(
        index: 4,
      ),
    );
  }
}
