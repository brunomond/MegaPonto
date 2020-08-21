import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/BottomApp.dart';

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  'Editar Funcionários',
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
                alignment: Alignment.center,
              ),
              onTap: () => Navigator.pushNamed(context, '/adm_funcio'),
            ),
            GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  'Editar Aplicativo',
                  style: TextStyle(fontSize: 32),
                ),
                alignment: Alignment.center,
              ),
              onTap: () => Navigator.pushNamed(context, '/adm_app'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomApp(
        index: 4,
      ),
    );
  }
}
