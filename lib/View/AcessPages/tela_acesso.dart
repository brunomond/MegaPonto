import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_chave_acesso.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_criar_conta.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_esqueceu_senha.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_login.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';

class Access extends StatefulWidget {
  Access({Key key}) : super(key: key);
  static int selectedItem = 0;

  @override
  _AccessState createState() => _AccessState();

  static navega(int index, BuildContext context) {
    _AccessState stateObject = context.findAncestorStateOfType<_AccessState>();
    stateObject.trocarTelaAcesso(index);
  }
}

class _AccessState extends State<Access> {
  List<Widget> _telas = [Login(), ChaveAcesso(), EsqueceuSenha(), CriarConta()];

  @override
  void initState() {
    super.initState();
    setState(() {
      Access.selectedItem = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Access.selectedItem == 3 ? 
    Scaffold(
      body: CriarConta(),
    )
    : Scaffold(
        body: Stack(
      children: <Widget>[
        GradientBackground(),
        Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.15,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(60.0),
                      topRight: const Radius.circular(60.0)),
                  color: Colors.white),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                scrollDirection: Axis.vertical,
                child: _telas[Access.selectedItem ?? 0],
              ),
            )),
      ],
    ));
  }

  void trocarTelaAcesso(int index) {
    setState(() => Access.selectedItem = index);
  }
}
