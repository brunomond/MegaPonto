import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/MembrosCard.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';

class Admin extends StatelessWidget {
  List<Usuario> listFuncionarios = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                child: Text('Editar Funcionários'),
              ),
              GestureDetector(
                child: Text('Editar Aplicativo'),
              ),
            ],
          );
        },
        itemCount: listFuncionarios.length,
      ),
      //bottomNavigationBar: BottomAppBar(),
    );
  }
}
