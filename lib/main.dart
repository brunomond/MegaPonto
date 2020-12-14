import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:megaponto_oficial/Controller/session_controller.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_adm.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_adm_perfil.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_edit_funcionario.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_editar_aplicativo.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_nomenclatura.dart';
import 'package:megaponto_oficial/View/HomePage/tela_criar_noticia.dart';
import 'package:megaponto_oficial/View/HomePage/tela_editar_perfil.dart';
import 'package:megaponto_oficial/View/HomePage/tela_feed.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<SessionController>(
          create: (_) => SessionController(),
        )
      ],
      child: MaterialApp(
        navigatorKey: mainState,
        debugShowCheckedModeBanner: false,
        title: 'Mega Ponto',
        initialRoute: '/',
        routes: {
          '/': (context) => CheckSession(),
          '/adm': (context) => Admin(),
          '/adm_funcio': (context) => EditarFuncionario(),
          '/adm_app': (context) => EditarAplicativo(),
          '/adm_app_escrita': (context) => EditarAplicativo(),
          '/adm_perfil': (context) => AdmEditarPerfil(),
          '/adm_nomenclatura': (context) => EditarNomenclatura(),
          '/home': (context) => Home(),
          '/acesso': (context) => Access.withItem(),
          '/login': (context) => Access.withItem(itemIndex: 0),
          '/chave_acesso': (context) => Access.withItem(itemIndex: 1),
          '/esqueceu_senha': (context) => Access.withItem(itemIndex: 2),
          '/criar_conta': (context) => CriarConta(),
          '/feed': (context) => Feed(),
          '/criar_noticia': (context) => CriarNoticia(),
          '/editar_perfil': (context) => EditarPerfil()
        },
        theme: ThemeData(
            primaryColor: Color.fromRGBO(140, 32, 55, 1),
            accentColor: Color.fromRGBO(61, 1, 78, 1),
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
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
                alignLabelWithHint: true,
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
              headline3:
                  TextStyle(color: Colors.white, fontFamily: 'Bebas Neue'),
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
      ),
    );
  }
}
