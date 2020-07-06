import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool loading = true;
  bool started = false;

  @override
  void initState() {
    super.initState();
    _start();
    
  }

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
          child: loading ?
          RaisedButton(
            onPressed: () {},
            child: CircularProgressIndicator(),
          ) 
          : started ? 
          RaisedButton(
            onPressed: () {
              
                _fecharPlantao();
              },
            child: Text('Fechar Plantão', style: TextStyle(fontSize: 20)),
          ) 
          : RaisedButton(
            onPressed: () async {
              _iniciarPlantao();
            },
            child: Text('Iniciar Plantão',
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
      _showSnack(DateFormat.Hm().format(DateTime.now()), false);
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
                content: Text('Plantão encerrado às $time'),
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