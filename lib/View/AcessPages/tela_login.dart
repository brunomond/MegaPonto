import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/login_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController controller = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: Globals.windowSize.width * 0.5,
                height: Globals.windowSize.width * 0.5,
                child: Image.asset("images/logo_mega_simbolo.png")),
            StdTextInput(
              keyboardType: TextInputType.emailAddress,
              hintText: 'E-mail',
              prefixIcon: Icons.email,
              onChanged: controller.setEmail,
              enabled: !controller.loading,
            ),
            StdTextInput(
              hintText: 'Senha',
              obscureText: !controller.visible,
              prefixIcon: Icons.vpn_key,
              suffixIcon: IconButton(
                icon: Icon(controller.iconVisibility),
                onPressed: controller.toggleVisibility,
              ),
              onChanged: controller.setPassword,
              enabled: !controller.loading,
              done: true,
            ),
            Container(
              width: Globals.windowSize.width,
              padding: EdgeInsets.only(top: 8, right: 8),
              child: GestureDetector(
                child: Text("Esqueci minha senha",
                    textAlign: TextAlign.right,
                    style: Globals.textTheme.overline),
                onTap: () => Navigator.pushNamed(context, '/esqueceu_senha'),
              ),
            ),
            StdButton(
                padding: EdgeInsets.only(top: 24, bottom: 8),
                label: 'Entrar',
                onPressed: controller.loginPressed
                    ? () => controller.login(context)
                    : null),
            Center(
              child: GestureDetector(
                child: Text(
                  "Criar uma conta",
                  textAlign: TextAlign.center,
                  style: Globals.textTheme.overline,
                ),
                onTap: () => Navigator.pushNamed(context, '/chave_acesso'),
              ),
            )
          ],
        ),
      );
    });
  }
}
