import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Telas
import 'View/tela_checksession.dart';
import 'View/HomePage/tela_feed.dart';
import 'View/HomePage/tela_home.dart';
import 'View/HomePage/tela_ponto.dart';
import 'View/HomePage/tela_plantao_amigo.dart';
import 'View/HomePage/tela_perfil.dart';
import 'View/AcessPages/tela_chave_acesso.dart';
import 'View/AcessPages/tela_criar_conta.dart';
import 'View/AcessPages/tela_login.dart';
import 'View/AcessPages/tela_esqueceu_senha.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  runApp(MegaPonto());
}

class MegaPonto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mega Ponto',
      initialRoute: '/',
      routes: {
        '/': (context) => CheckSession(),
        '/home': (context) => Home(),
        '/home_ponto': (context) => Ponto(),
        '/home_feed': (context) => Feed(),
        '/home_plantao_amigo': (context) => PlantaoAmigo(),
        '/home_perfil': (contex) => Perfil(),
        '/login': (context) => Login(),
        '/criar_conta': (context) => CriarConta(),
        '/chave_acesso': (context) => ChaveAcesso(),
        '/esqueceu_senha': (context) => EsqueceuSenha(),
      },
    );
  }
}
