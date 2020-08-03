import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class EsqueceuSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: Globals.windowSize.width * 0.4,
                height: Globals.windowSize.width * 0.4,
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
              StdTextInput(
                padding: EdgeInsets.only(top: 24),
                keyboardType: TextInputType.emailAddress,
                hintText: 'E-mail',
                prefixIcon: Icons.email,
                done: true,
              ),
              StdButton(
                padding: EdgeInsets.only(top: 24, bottom: 8),
                label: 'Enviar',
                onPressed: () {},
              ),
              Center(
                child: GestureDetector(
                  child: Text("cancelar",
                      textAlign: TextAlign.center,
                      style: Globals.textTheme.overline),
                  onTap: () => Navigator.of(context).pop(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
