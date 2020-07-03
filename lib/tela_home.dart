import 'package:flutter/material.dart';
import 'package:megaponto_oficial/main.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool iniciado = false;
  int numPessoasOnline = 5;
  int horas = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.red,
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "images/fundo_principal.png",
            ),
            Column(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 30, 1),
                child: Row(
                  //inicio nome&perfil
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rick Sanchez",
                          style: GoogleFonts.salsa(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        Text(
                          "Megariano Regular",
                          style: GoogleFonts.salsa(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/Rubio_Circle.png")),
                      ),
                    )
                  ],
                ), //fim nome&perfil
              ),
              Container(
                  //inicio listFuncionalidades
                  padding: EdgeInsets.fromLTRB(0, 40, 20, 1),
                  height: 70,
                  child: _listFuncionalidades()), //fim listFuncionalidades
              Divider(
                height: 20,
              ),
              Container(
                color: Colors.white,
                height: 400,
                padding: EdgeInsets.fromLTRB(0, 5, 16, 1),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          '$numPessoasOnline MegaMembros na sala :)',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      padding: EdgeInsets.only(top: 10),
                      child: _listOnline(),
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Row(children: [
                            Icon(
                              Icons.person_pin,
                              size: 20,
                            ),
                            Text(
                              'Clima normal de trabalho',
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                            Icon(
                              Icons.expand_more,
                              size: 20,
                            ),
                          ]),
                        ),
                        InkWell(
                          child: Row(children: [
                            Icon(
                              Icons.account_circle,
                              size: 20,
                            ),
                            Text(
                              'Café feito às $horas de hoje',
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                            Icon(
                              Icons.expand_more,
                              size: 20,
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            iniciado = !iniciado;
                          });
                          String time = DateFormat.yMd()
                              .add_jm()
                              .format(DateTime.now().toUtc());
                          final snackBar = new SnackBar(
                            content: Text(time),
                            duration: Duration(seconds: 5),
                          );

                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        },
                        child: Text(
                            iniciado ? 'Fechar Plantão' : 'Iniciar Plantão',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }

  Widget _listFuncionalidades() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        FlatButton(
          child: Text(
            "Feed",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
        ),
        FlatButton(
          child: Text(
            "MegaPonto",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
        ),
        FlatButton(
          child: Text(
            "Leaderboard",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
        ),
        FlatButton(
          child: Text(
            "Plantão Amigo",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _listOnline() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        ),
      ],
    );
  }
}
