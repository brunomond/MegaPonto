import 'package:flutter/material.dart';
import 'package:megaponto_oficial/presentation/custom_icons_icons.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomApp(),
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 15, 0),
            height: 140,
            child: _listOnline(),
          ),
          Expanded(
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(50.0),
                    topRight: const Radius.circular(50.0))),
                child: Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      return _feedCard(context, index);
                    },
                    itemCount: 5,
                  ),
                ),
          )),
        ],
      ),
    );
  }

  Widget _feedCard(BuildContext context, int index){
      return Padding( 
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Color.fromRGBO(242, 242, 242, 1),
              child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard"),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 3),
                                child: Text("Morty Smith", style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                              Text("04 de Fevereiro às 16:34", style: TextStyle(
                                fontSize: 14
                              ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " sed do eiusmod tempor incididunt ut labore et dolore"
                          " magna aliqua. Ut enim ad minim veniam, quis nostrud ",
                      style: TextStyle(
                          fontSize: 13
                      ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10,), child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),)
                  ],
                ),

              ),
            ),
          )
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(
                    color: Color.fromRGBO(106, 210, 53, 1),
                  ),
                  image: DecorationImage(
                    image: NetworkImage("$imagem"),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 5,
          ),
          Text(
            "$texto",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _bottomApp() {
    return Container(
      child: BottomNavigationBar(
          backgroundColor: Colors.grey[90],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(65, 3, 76, 1),
          unselectedItemColor: Colors.black87,
          elevation: 16,
          iconSize: 36,
          //showUnselectedLabels: false,
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
                icon: Icon(CustomIcons.amigo), title: Text('Plantão Amigo'))
          ]),
      decoration: BoxDecoration(color: Colors.grey[90], boxShadow: [
        BoxShadow(spreadRadius: 3, blurRadius: 0, offset: Offset(2, 3))
      ]),
    );
  }
}
