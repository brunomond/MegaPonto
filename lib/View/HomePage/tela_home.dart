import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'file:///C:/Users/Bruno%20Monteiro/Desktop/Mega/MegaPonto/lib/View/HomePage/Widgets/BottomApp.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
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
      appBar: _selectedItem != 2 ? GradientAppBar() : null,
      key: _scaffoldKey,
      bottomNavigationBar: BottomApp(
        index: _selectedItem,
        onTap: tapBottomBar,
      ),
      body: _telas[_selectedItem],
    );
  }

  void tapBottomBar(int index) {
    setState(() => _selectedItem = index);
  }
}
