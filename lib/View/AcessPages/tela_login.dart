import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/LoginController.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  LoginController controller = new LoginController();
  Usuario usuario = new Usuario();

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
              decoration: InputDecoration(
                  hintText: 'E-mail',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.email,
                      color: Colors.grey,
                      ),
                  )),
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onSaved: (value) => controller.senha = value,
                decoration: InputDecoration(
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.vpn_key,
                        color: Colors.grey,
                      ),
                    )),
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 13),
                ),
                onPressed: () => Access.navega(2, context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.5,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius:
                        BorderRadius.all(Radius.circular(32))),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () async =>
                        await controller.doLogin(usuario) ?
                        Navigator.of(context).popAndPushNamed('/home') : print('Login Falhou'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Criar uma conta",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 13),
                ),
                onPressed: () => Access.navega(1, context),
              ),
            )
          ],
        )
      );
  }
}