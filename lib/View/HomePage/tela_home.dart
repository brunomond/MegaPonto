import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/BottomApp.dart';

//Fragmentos BottomBar
import 'tela_feed.dart';
import 'tela_ponto.dart';
import 'tela_plantao_amigo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedItem;
  List<Widget> _telas = [Feed(), Ponto(), PlantaoAmigo()];

  @override
  void initState() {
    super.initState();
    setState(() => _selectedItem = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
