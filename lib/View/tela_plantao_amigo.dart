import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/tela_feed.dart';
import 'package:megaponto_oficial/presentation/custom_icons_icons.dart';

class PlantaoAmigo extends StatefulWidget {
  @override
  _PlantaoAmigoState createState() => _PlantaoAmigoState();
}

class _PlantaoAmigoState extends State<PlantaoAmigo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: _bottomApp(),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
              Color.fromRGBO(65, 3, 76, 1),
              Color.fromRGBO(199, 59, 34, 1)
            ])),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(40, 20, 20, 10),
                      child: Text(
                        "Quem está na sala?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
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
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Feed()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlantaoAmigo()));
        break;
    }
  }
}

Widget _listMembros(BuildContext context, int index) {
  return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Column(
        children: [
          Row(
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
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Rick Sanchez",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 40, 0),
                child: Text(
                  "IOS",
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 255, 0, 1),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ));
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
