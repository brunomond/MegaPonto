import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/BottomApp.dart';
import 'package:megaponto_oficial/View/Utils/ListOnline.dart';

//Fragmentos BottomBar
import 'tela_feed.dart';
import 'tela_ponto.dart';
import 'tela_plantao_amigo.dart';

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
    Ponto(scaffoldKey: _scaffoldKey),
    PlantaoAmigo()
  ];

  @override
  void initState() {
    super.initState();
    setState(() => _selectedItem = 1);
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
          //  bottom: 0,
          //  left: 0,
          //  right: 0,
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
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("$imagem"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text("$texto", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
