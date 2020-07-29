import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';
class ListOnline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.065),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: _listOnline()),
              Padding(padding: EdgeInsets.only(top: 8), child: _textOnline())
            ],
          )),
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

  Widget _textOnline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
          ' 5 MegaMembros na sala :)',
          style: TextStyle(
              fontSize: 21, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
