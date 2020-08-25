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
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.36,
              child: OutlineButton(
                child: Text(
                  'Editar Funcionários',
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
                onPressed: () => Navigator.pushNamed(context, '/adm_funcio'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.36,
              child: OutlineButton(
                child: Text(
                  'Editar Aplicativo',
                  style: TextStyle(fontSize: 32),
                ),
                onPressed: () => Navigator.pushNamed(context, '/adm_app'),
              ),
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
