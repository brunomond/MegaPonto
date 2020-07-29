import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdPrefixIcon.dart';

class EsqueceuSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.width * 0.45,
              child: Image.asset("images/esqueceu_senha.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                "Esqueceu sua senha?",
                textAlign: TextAlign.center,
                style: Globals.textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 300,
                child: Text(
                  "Por favor, informe o E-mail associado à sua conta que inviaremos um link para restauração de sua senha.",
                  textAlign: TextAlign.justify,
                  style: Globals.textTheme.bodyText2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: StdPrefixIcon(iconData: Icons.email)
                ).applyDefaults(Globals.inputTheme),
              ),
            ),
            StdButton(padding: EdgeInsets.only(top: 24), label: 'Enviar', onPressed: () {},),
            Center(
              child: GestureDetector(
                child: Text(
                  "cancelar",
                  textAlign: TextAlign.center,
                  style: Globals.textTheme.overline
                ),
                onTap:() => Access.navega(0, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}