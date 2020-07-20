import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/LoginController.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';

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
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset("images/mega_logo.png"),
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
                  onPressed: () => Navigator.of(context)
                      .pushNamed('/esqueceu_senha'),
                ),
              ),
              Container(
                height: 60,
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
                  onPressed: () =>
                      Navigator.pushNamed(context, '/chave_acesso'),
                ),
              )
            ],
          )
        )
      );
  }
}
