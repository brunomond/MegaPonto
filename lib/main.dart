import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Telas
import 'View/AcessPages/tela_acesso.dart';
import 'View/tela_checksession.dart';
import 'View/HomePage/tela_home.dart';
import 'View/AcessPages/tela_criar_conta.dart';
import 'View/AcessPages/tela_login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  runApp(MegaPonto());
}

class MegaPonto extends StatelessWidget {
  static final GlobalKey<NavigatorState> mainState =
      new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: mainState,
      debugShowCheckedModeBanner: false,
      title: 'Mega Ponto',
      initialRoute: '/',
      routes: {
        '/': (context) => CheckSession(),
        '/home': (context) => Home(),
        '/acesso': (context) => Access(),
        '/login': (context) => Login(),
        '/criar_conta': (context) => CriarConta(),
      },
      theme: ThemeData(
          primaryColor: Color.fromRGBO(230, 19, 0, 1),
          accentColor: Color.fromRGBO(61, 1, 78, 1),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
          textTheme: TextTheme(
            button: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'Roboto'),
            bodyText1: TextStyle(
                color: Colors.black87, fontSize: 28, fontFamily: 'Roboto'),
            bodyText2: TextStyle(
                color: Colors.black87, fontSize: 16, fontFamily: 'Roboto'),
            overline: TextStyle(color: Colors.grey, fontSize: 13),
          )),
    );
  }
}
