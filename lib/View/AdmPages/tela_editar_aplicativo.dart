import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/BottomApp.dart';
import 'package:megaponto_oficial/View/AdmPages/WidgetsAdm/color_app.dart';
import 'package:megaponto_oficial/View/AdmPages/WidgetsAdm/name_funcionario.dart';

class EditarAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ColorApp(),
          ),
          NameFuncionario(),
        ],
      ),
      bottomNavigationBar: BottomApp(
        index: 4,
      ),
    );
  }
}
