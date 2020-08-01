import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

//Telas
import 'View/AcessPages/tela_acesso.dart';
import 'View/tela_checksession.dart';
import 'View/HomePage/tela_home.dart';
import 'View/AcessPages/tela_criar_conta.dart';

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
        '/acesso': (context) => Access.withItem(),
        '/login': (context) => Access.withItem(itemIndex: 0),
        '/chave_acesso': (context) => Access.withItem(itemIndex: 1),
        '/esqueceu_senha': (context) => Access.withItem(itemIndex: 2),
        '/criar_conta': (context) => CriarConta(),
      },
      theme: ThemeData(
          primaryColor: Color.fromRGBO(140, 32, 55, 1),
          accentColor: Color.fromRGBO(61, 1, 78, 1),
          dialogTheme: DialogTheme(
            shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
            backgroundColor: Color.fromRGBO(140, 32, 55, 1),
            titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Segoe UI',
                color: Colors.white),
            contentTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'Segoe UI',
                color: Colors.white),
          ),
          inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(140, 32, 55, 1))),
              hoverColor: Color.fromRGBO(140, 32, 55, 1),
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Segoe UI',
                  textBaseline: TextBaseline.alphabetic),
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: Colors.red))),
          textTheme: TextTheme(
              button: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Segoe UI',
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  color: Colors.black87, fontSize: 28, fontFamily: 'Segoe UI'),
              bodyText2: TextStyle(
                  color: Colors.black87, fontSize: 16, fontFamily: 'Segoe UI'),
              overline: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  letterSpacing: -0.5,
                  wordSpacing: 0),
              headline3: TextStyle(color: Colors.white, fontFamily: 'Cookie'),
              headline5: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI'),
              headline6: TextStyle(
                  fontSize: 21,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Segoe UI'),
          )),
    );
  }
}
