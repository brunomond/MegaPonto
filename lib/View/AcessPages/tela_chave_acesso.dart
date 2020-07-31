import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class ChaveAcesso extends StatefulWidget {
  @override
  _ChaveAcessoState createState() => _ChaveAcessoState();
}

class _ChaveAcessoState extends State<ChaveAcesso> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: Globals.windowSize.width * 0.5,
              height: Globals.windowSize.width * 0.5,
              child: Image.asset("images/pato_projeto.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text("Qual a sua chave de acesso?",
                  textAlign: TextAlign.center,
                  style: Globals.textTheme.bodyText1),
            ),
            StdTextInput(
              padding: EdgeInsets.only(top: 24),
              keyboardType: TextInputType.number,
              hintText: 'Chave de Acesso',
              prefixIcon: Icons.check_circle,
              done: true,
            ),
            StdButton(
              label: 'Confirmar',
              onPressed: () =>
                  Navigator.of(context).popAndPushNamed('/criar_conta'),
              padding: EdgeInsets.only(top: 24, bottom: 8),
            ),
            Center(
              child: GestureDetector(
                child: Text("Cancelar",
                    textAlign: TextAlign.center,
                    style: Globals.textTheme.overline),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
