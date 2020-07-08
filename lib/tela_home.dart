import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megaponto_oficial/View/Feed.dart';
import 'package:megaponto_oficial/presentation/custom_icons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextStyle _botaoStyle = TextStyle(color: Colors.white, fontSize: 20);
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
        bottomNavigationBar: _bottomApp(),
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(overflow: Overflow.visible, children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromRGBO(61, 1, 78, 1),
                          Color.fromRGBO(199, 59, 35, 1)
                        ])),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: _listOnline(),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.17,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(50.0),
                              topRight: const Radius.circular(50.0)),
                          color: Colors.white),
                    ),
                  )
                ]),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [_textOnline(), _estadoSala(), _infoPlantao()],
                  ),
                )
              ],
            )));
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

  Widget _infoPlantao() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50),
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
          Container(
              width: 200,
              height: 51,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(143, 58, 56, 1),
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              child: loading
                  ? FlatButton(
                      child: CircularProgressIndicator(),
                    )
                  : started
                      ? FlatButton(
                          child: Text('Fechar Plantão', style: _botaoStyle),
                          onPressed: () async => _fecharPlantao(),
                        )
                      : FlatButton(
                          child: Text('Iniciar Plantão', style: _botaoStyle),
                          onPressed: () async => _iniciarPlantao(),
                        )),
        ],
      ),
    );
  }

  Widget _listOnline() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _itemListOnline(
            "Kazuo", "https://api.adorable.io/avatars/285/abott@adorable.png"),
        _itemListOnline("Bruno",
            "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard"),
        _itemListOnline(
            "Cleber", "https://api.adorable.io/avatars/206/abott@exaust.io"),
        _itemListOnline(
            "Eduardo", "https://api.adorable.io/avatars/206/abott@strong.io"),
        _itemListOnline(
            "Jose", "https://api.adorable.io/avatars/206/abott@hungry.io"),
        _itemListOnline(
            "Enzo", "https://api.adorable.io/avatars/206/abott@fasty.io"),
      ],
    );
  }

  Widget _itemListOnline(String texto, String imagem) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  border: new Border.all(color: Colors.lightGreenAccent),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("$imagem"),
                  ),
                ),
              ),
            ],
          ),
          Text("$texto", style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  Widget _bottomApp() {
    return Container(
      child: BottomNavigationBar(
          onTap: tapppppp,
          backgroundColor: Colors.grey[90],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(61, 1, 78, 1),
          unselectedItemColor: Colors.black87,
          elevation: 16,
          iconSize: 36,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.feed), title: Text('Feed')),
            BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.megaponto,
                ),
                title: Text('MegaPonto')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.leaderboard),
                title: Text('Leaderboard')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.plantaoamigo),
                title: Text('Plantão Amigo')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.do_utilizador), title: Text('Perfil')),
          ]),
      decoration: BoxDecoration(color: Colors.grey[90], boxShadow: [
        BoxShadow(spreadRadius: 3, blurRadius: 0, offset: Offset(2, 3))
      ]),
    );
  }

  tapppppp(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
  }

  Widget _textOnline() {
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

  Widget _estadoSala() {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
        InkWell(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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

    prefs
        .setInt('startTime', DateTime.now().toUtc().millisecondsSinceEpoch)
        .then((value) {
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

  String _formatDuration(Duration duration) {
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

  void _showSnack(String time, bool start) {
    SnackBar snackBar;

    snackBar = start
        ? snackBar = new SnackBar(
            content: Text('Plantão iniciado às $time'),
            duration: Duration(seconds: 2),
          )
        : snackBar = new SnackBar(
            content: Text('Duração do plantão: $time'),
            duration: Duration(seconds: 2),
          );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _start() async {
    await _getSharedInstance().then((value) {
      setState(() {
        started = value.get('startTime') != null;
        loading = false;
      });
    });
  }
}
