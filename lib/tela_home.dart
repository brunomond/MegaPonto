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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      key: _scaffoldKey,
      body: SafeArea(
          child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 30, 1),
          child: Row(
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("images/Rubio_Circle.png")
                  ),
                ),
              )
            ],
          ),
        ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 40, 20, 1),
            height: 70,
            child: _listFuncionalidades()),

        Divider(
          height: 200,
        ),
        Container(
          child: RaisedButton(
            onPressed: () {
              setState(() {
                iniciado = !iniciado;
              });

              String time =
                  DateFormat.yMd().add_jm().format(DateTime.now().toUtc());
              final snackBar = new SnackBar(
                content: Text(time),
                duration: Duration(seconds: 5),
              );

              _scaffoldKey.currentState.showSnackBar(snackBar);
            },
            child: Text(iniciado ? 'Fechar Plantão' : 'Iniciar Plantão',
                style: TextStyle(fontSize: 20)),
          ),
        ),
      ])),
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
}
