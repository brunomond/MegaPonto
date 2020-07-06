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
          padding: EdgeInsets.fromLTRB(0, 20, 25, 0),
          child: _infoPessoais(),
        ),
        Divider(
          height: 30,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                _membrosOnline(),
                Container(
                  height: 80,
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: _listOnline(),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: _clima()),
                Expanded(child: _plantao())
              ],
            ),
          ),
        )
      ])),
    );
  }

  Widget _infoPessoais() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Rick Sanchez",
                style: GoogleFonts.salsa(
                    textStyle: TextStyle(color: Colors.white, fontSize: 20)),
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
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage("images/Rubio_Circle.png")),
          ),
        )
      ],
    );
  }

  Widget _listOnline() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          padding: EdgeInsets.only(left: 35),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("images/Rubio_Circle.png"),
            ),
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

  Widget _membrosOnline() {
    return Container(
      padding: EdgeInsets.fromLTRB(53, 25, 0, 0),
      child: Row(
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
            ' $numPessoasOnline' + ' MegaMembros na sala :)',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _clima() {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(children: [
            Icon(
              Icons.personal_video,
              size: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
              child: Text(
                'Clima normal de trabalho',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
            Icon(
              Icons.expand_more,
              size: 30,
            ),
          ]),
        ),
        Divider(
          height: 13,
          color: Colors.transparent,
        ),
        InkWell(
          child: Row(children: [
            Icon(
              Icons.cake,
              size: 30,
            ),
            Container(
              child: Text(
                'Café feito às $horas de hoje',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
              padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
            ),
            Icon(
              Icons.expand_more,
              size: 30,
            ),
          ]),
        ),
      ],
    );
  }

  Widget _plantao() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 80),
            child: Text(
              "Partiu entregar alguns projetos?!",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 13),
            child: Text(
              "Inicie seu Plantão!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 13,
          ),
          Container(
            width: 200,
            height: 51,
            decoration: BoxDecoration(
                color: Color.fromRGBO(143, 38, 56, 1),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: FlatButton(
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
              child: Text(iniciado ? 'Finalizar' : 'Iniciar',
                  style: TextStyle(fontSize: 23, color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
