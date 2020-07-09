import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/tela_feed.dart';
import 'package:megaponto_oficial/View/tela_plantao_amigo.dart';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/presentation/custom_icons_icons.dart';


class PlantaoAmigo extends StatefulWidget {
  @override
  _PlantaoAmigoState createState() => _PlantaoAmigoState();
}

class _PlantaoAmigoState extends State<PlantaoAmigo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      bottomNavigationBar: BottomAppBar(child: _bottomApp(),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 15, 0),
              height: 140,
              child: Text(
                "Pesoas Online",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(50.0),
                        topRight: const Radius.circular(50.0))),
                child: Column(
                  children: [
                    Text("Quem está na sala?"),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        return _listMembros(context, index);
                      },
                      itemCount: 10,
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomApp() {
    return Container(
      child: BottomNavigationBar(
          onTap: navegacaoBottomBar,
          backgroundColor: Colors.grey[90],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(61, 1, 78, 1),
          unselectedItemColor: Colors.black87,
          elevation: 16,
          iconSize: 36,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.jornal), title: Text('Feed')),
            BottomNavigationBarItem(
                icon: Icon(
                  CustomIcons.relogio,
                ),
                title: Text('MegaPonto')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.podio), title: Text('Leaderboard')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.amigo), title: Text('Plantão Amigo')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.clima_normal), title: Text('Perfil')),
          ]),
      decoration: BoxDecoration(color: Colors.grey[90], boxShadow: [
        BoxShadow(spreadRadius: 3, blurRadius: 0, offset: Offset(2, 3))
      ]),
    );
  }

  navegacaoBottomBar(int index) {
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlantaoAmigo()));
        break;
    }
  }

}

Widget _listMembros(BuildContext context, int index) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 5, 20, 30),
    child: Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard"),
            ),
          ),
        ),
        Text("Rick Sanchez"),
        Text("IOS"),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 255, 0, 1),
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}


/*Future<Map> _obterGifs() async{
  http.Response resposta;

  resposta = await http.post("https://paineljunior.com.br/api/login",
      body: <String, String>{
        'email': 'zoe@gmail.com',
        'senha': '12345678'}
  );

  Map<String, dynamic> user = json.decode(resposta.body);

  return json.decode(resposta.body);
}*/
