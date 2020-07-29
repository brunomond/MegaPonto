import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/LoginController.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdPrefixIcon.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset("images/logo_mega_simbolo.png")),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => usuario.email = value,
              validator: (value) => value != null ? null : 'Insira um email!',
              decoration: InputDecoration(
                  hintText: 'E-mail',
                  prefixIcon: StdPrefixIcon(iconData: Icons.email,)
                  ).applyDefaults(Globals.inputTheme)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: !isPasswordVisible,
                onSaved: (value) => controller.senha = value,
                validator: (value) => value != null ? null : 'Insira uma senha!',
                decoration: InputDecoration(
                    hintText: 'Senha',
                   suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: _trocarVisibilidadeSenha,
                    ),
                    prefixIcon: StdPrefixIcon(iconData: Icons.vpn_key,)
                    ).applyDefaults(Globals.inputTheme),
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: GestureDetector(
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                  style: Globals.textTheme.overline
                ),
                onTap: () => Access.navega(2, context), 
              ),
            ),
            StdButton(padding: EdgeInsets.only(top: 24),
                      label: 'Entrar', 
                      onPressed: () async =>
                        await controller.doLogin(usuario) ?
                        Navigator.of(context).popAndPushNamed('/home') : print('Login Falhou'),),
            Center(
              child: GestureDetector(
                child: Text(
                  "Criar uma conta",
                  textAlign: TextAlign.center,
                  style: Globals.textTheme.overline,
                ),
                onTap: () => Access.navega(1, context),
              ),
            )
          ],
        )
      );
  }

    void _trocarVisibilidadeSenha(){
      setState(() => isPasswordVisible = !isPasswordVisible);
  }
}
