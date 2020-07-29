import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/BottomApp.dart';
import 'package:megaponto_oficial/View/Utils/ListOnline.dart';

//Fragmentos BottomBar
import 'tela_feed.dart';
import 'tela_ponto.dart';
import 'tela_plantao_amigo.dart';
import 'tela_perfil.dart';
import 'tela_leaderboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variáveis de estado
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedItem;
  List<Widget> _telas = [
    Feed(),
    PlantaoAmigo(scaffold: _scaffoldKey),
    Ponto(scaffold: _scaffoldKey),
    Leaderboard(),
    Perfil(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() => _selectedItem = 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: BottomApp(
        index: _selectedItem,
        onTap: tapBottomBar,
      ),
      body: Stack(children: [
        ListOnline(),
        Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.22,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0)),
                  color: Colors.white),
              child: _telas[_selectedItem],
            ))
      ]),
    );
  }

  void tapBottomBar(int index) {
    setState(() => _selectedItem = index);
  }
}
