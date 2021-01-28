import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class EditarNomenclatura extends StatefulWidget {
  @override
  _EditarNomenclaturaState createState() => _EditarNomenclaturaState();
}

class _EditarNomenclaturaState extends State<EditarNomenclatura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          text: 'Cargos',
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Center(
            child: Text('+'),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return IntrinsicHeight(              
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 64,
                    child: TextFormField(
                      decoration: InputDecoration
                      (
                        border: OutlineInputBorder(),
                        hintText: 'Funcionário',
                      ),
                    ),
                    ),
                Expanded(
                  child: GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ));
          },
        ));
  }
}
