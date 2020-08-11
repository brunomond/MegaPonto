import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';

class ListOnline extends StatelessWidget {
  final List lista;
  final Usuario user;
  ListOnline({@required this.lista, this.user});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
          padding: EdgeInsets.only(top: Globals.windowSize.height * 0.065),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: Globals.windowSize.height * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [_itemListOnline(index)],
                      );
                    },
                  )),
              Padding(padding: EdgeInsets.only(top: 8), child: _textOnline())
            ],
          )),
    );
  }

  Widget _itemListOnline(int index) {
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
                    image: NetworkImage(
                        "https://api.adorable.io/avatars/285/abott@adorable.png"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child:
                Text(lista[index].nome, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _textOnline() {
    int quantidade = lista.length;
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
          ' $quantidade MegaMembros na sala :)',
          style: TextStyle(
              fontSize: 21, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
