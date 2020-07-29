import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdPrefixIcon.dart';

class ChaveAcesso extends StatefulWidget {
  @override
  _ChaveAcessoState createState() => _ChaveAcessoState();
}

class _ChaveAcessoState extends State<ChaveAcesso> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset("images/pato_projeto.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "Qual a sua chave de acesso?",
              textAlign: TextAlign.center,
              style: Globals.textTheme.bodyText1
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Chave de Acesso',
                  prefixIcon: StdPrefixIcon(iconData: Icons.check_circle)
                  ).applyDefaults(Globals.inputTheme),
              style: TextStyle(fontSize: 15),
            ),
          ),
          StdButton(label: 'Confirmar', onPressed: Access.navega(3, context), padding: EdgeInsets.only(top: 16),),
          Center(
            child: GestureDetector(
              child: Text(
                "Cancelar",
                textAlign: TextAlign.center,
                style: Globals.textTheme.overline
              ),
              onTap:() => Access.navega(0, context),
            ),
          ),
        ],
      ),
    );
  }
}
