import 'package:flutter/material.dart';
import 'package:megaponto_oficial/main.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megaponto_oficial/presentation/custom_icons_icons.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool started = false;
  bool loading = true;
  int numPessoasOnline = 5;
  int horas = 2;

  @override
  void initState() {
    super.initState();
    _start();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(74, 39, 146, 1),
        bottomNavigationBar: _bottomApp(),
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(65, 3, 76, 1),
                        Color.fromRGBO(199, 59, 34, 1)
                      ])),
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 30, 1),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 25, 0),
                    child: _infoPessoais(),
                  ),
                ),
                Divider(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100.0)),
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
        ));
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
            color: Colors.transparent,
          ),
          Container(
            width: 200,
            height: 51,
            decoration: BoxDecoration(
                color: Color.fromRGBO(143, 38, 56, 1),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: loading ? FlatButton(child: CircularProgressIndicator(),)
            : started ?
            FlatButton(child: Text('Fechar Plantão'), onPressed: () async => _fecharPlantao(),)
            : FlatButton(child: Text('Iniciar Plantão'), onPressed: () async => _iniciarPlantao(),)
          ),
        ],
      ),
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
              CustomIcons.do_utilizador,
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
              CustomIcons.coffee_break,
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

  void _iniciarPlantao() async {

    SharedPreferences prefs = await _getSharedInstance();

    prefs.setInt('startTime', DateTime.now().toUtc().millisecondsSinceEpoch).then((value) {
      setState(() => started = true);
      _showSnack(DateFormat.Hm().format(DateTime.now()), true);
    });
  }

  void _fecharPlantao() async {

    SharedPreferences prefs = await _getSharedInstance();

    int time = prefs.get('startTime');
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(time);
    Duration timeOnline = DateTime.now().toUtc().difference(startTime);



    prefs.remove('startTime').then((value) {
      setState(() => started = false);
      _showSnack(_formatDuration(timeOnline), false);
    });

  }

  String _formatDuration(Duration duration){

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<SharedPreferences> _getSharedInstance() async {
    SharedPreferences prefs;
    setState(() {
      loading = true;
    });

    await SharedPreferences.getInstance().then((value) {
      prefs = value;
      setState(() {
        loading = false;
      });
    });
    print(prefs);
    return prefs;

  }

  void _showSnack(String time, bool start){

    SnackBar snackBar;

    snackBar = start ? snackBar = new SnackBar(
      content: Text('Plantão iniciado às $time'),
      duration: Duration(seconds: 2),
    )
        : snackBar = new SnackBar(
      content: Text('Duração do plantão: $time'),
      duration: Duration(seconds: 2),
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _start() async{

    await _getSharedInstance().then((value) {
      setState(() {
        started = value.get('startTime') != null;
        loading = false;
      });
    });

  }
}