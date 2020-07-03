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
      backgroundColor: Color.fromRGBO(74, 39, 146, 1),
      bottomNavigationBar: _bottomApp(),
      key: _scaffoldKey,
      body: SafeArea(
            child: Column(children: <Widget>[
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
                      padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
                      height: 70,
                      child: _listFuncionalidades()),
              Divider(
                height: 30,
              ),//fim listFuncionalidades
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0)),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.fromLTRB(60, 20, 16, 1),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 255, 0, 1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                ' $numPessoasOnline' +  ' MegaMembros na sala :)',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(top: 18),
                            child: _listOnline(),
                          ),
                          Divider(
                            height: 30,
                            color: Colors.transparent,
                          ),

                          Container(
                            child: Column(
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
                                Divider(
                                  height: 10,
                                  color: Colors.transparent,
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
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 80),
                            child: Text(
                              "Partiu entregar alguns projetos?!",
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                                "Inicie seu Plantão!"
                            ),
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
                  )
                ])
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
                DecorationImage(image: AssetImage("images/Rubio_Circle.png"),),
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

  Widget _bottomApp() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Color.fromRGBO(74, 39, 146, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.map,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}



