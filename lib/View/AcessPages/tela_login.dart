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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //Faz com que a tela possa ser rolada, porém acredito que não está da forma certa
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromRGBO(65, 3, 76, 1),
                  Color.fromRGBO(199, 59, 34, 1)
                ])),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                //Image.asset("images/fundo_principal.png"),
                Padding(
                    padding: EdgeInsets.only(left: 35, top: 130),
                    child: Text("<MegaPonto/>",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Futura"))),
                Positioned(
                    top: 180,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90),
                              topRight: Radius.circular(90))),
                      child: Form(
                        key: controller.formKey,
                        child:ListView(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("images/mega_logo.png"),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Material(
                            elevation: 5,
                            shadowColor: Colors.grey,
                            borderRadius: BorderRadius.circular(32),
                            child: TextFormField(
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
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 5,
                            shadowColor: Colors.grey,
                            borderRadius: BorderRadius.circular(32),
                            child: TextFormField(
                              onSaved: (value) => controller.senha = value,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Senha',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Icon(
                                      Icons.lock,
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
                              onPressed: () => Navigator.of(context)
                                  .pushNamed('/esqueceu_senha'),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 60, left: 60),
                            child: Container(
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
                          ),
                          SizedBox(
                            height: 5,
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
                      ),
                    ))
                )],
            ),
          ),
        ),
      ),
    );
  }
}
