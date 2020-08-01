import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/LoginController.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController controller = new LoginController();
  Usuario usuario = new Usuario();
  bool isPasswordVisible;

  @override
  void initState() {
    isPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Padding(
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
                validator: (value) =>
                    value != null && value.isNotEmpty ? null : 'Insira um email!',
                onSaved: (value) => usuario.email = value,
              ),
              StdTextInput(
                hintText: 'Senha',
                obscureText: !isPasswordVisible,
                prefixIcon: Icons.vpn_key,
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: _trocarVisibilidadeSenha,
                ),
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : 'Insira uma senha!',
                onSaved: (value) => controller.senha = value,
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
                onPressed: () async => await controller.doLogin(usuario, context)
                    ? Navigator.of(context).popAndPushNamed('/home')
                    : null,
              ),
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
        ));
  }

  void _trocarVisibilidadeSenha() {
    setState(() => isPasswordVisible = !isPasswordVisible);
  }
}
