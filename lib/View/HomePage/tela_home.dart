import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View//HomePage/Widgets/BottomApp.dart';
import 'package:megaponto_oficial/View/HomePage/tela_leaderboard.dart';
import 'package:megaponto_oficial/View/Utils/ConstPopupMenu.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Fragmentos BottomBar
import 'tela_feed.dart';
import 'tela_ponto.dart';
import 'tela_plantao_amigo.dart';
import 'tela_perfil.dart';

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
    LeaderBoard(),
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
      appBar: _selectedItem != 2
          ? GradientAppBar(
              actions: _selectedItem == 4
                  ? <Widget>[
                      PopupMenuButton(
                        onSelected: choiceAction,
                        itemBuilder: (BuildContext context) {
                          return ConstPopupMenu.choices.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ]
                  : null,
            )
          : null,
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

  void _logOut() async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.remove(prefs.getString('loginAuth'));
      prefs.remove('loginAuth');
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    });
  }

  void choiceAction(String choice) {
    if (choice == ConstPopupMenu.Logout) {
      _logOut();
    } else if (choice == ConstPopupMenu.EditPerfil) {
      Navigator.pushNamed(context, '/editar_perfil');
    } else if (choice == ConstPopupMenu.Admin) {
      Navigator.pushNamed(context, '/adm');
    }
  }
}
