import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/BottomApp.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class EditarNomenclatura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StdTextInput(
              padding: EdgeInsets.fromLTRB(8.0, 16, 8, 8),
              hintText: '0 horas - 15 horas',
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
