import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/feed_noticia_controller.dart';
import 'package:megaponto_oficial/View/HomePage/tela_noticia_expandida.dart';

class CardFeed extends StatelessWidget {
  final List lista;
  final int index;
  final FeedNoticiaController controller;
  CardFeed(
      {@required this.lista, @required this.index, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: GestureDetector(
          onTap: () {
            controller.setTitulo(lista[index].titulo);
            Navigator.pushNamed(context, '/noticia_expandida');
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Color.fromRGBO(242, 242, 242, 1),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/abott@adorable.png'),
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
                              child: Text(
                                (lista[index].nomeUsuario != null &&
                                        lista[index].nomeUsuario != '')
                                    ? lista[index].nomeUsuario
                                    : 'Não tem nome',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              lista[index].created,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      lista[index].conteudo,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
