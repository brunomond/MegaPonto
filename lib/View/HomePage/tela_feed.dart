import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/noticia.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/cardFeed.dart';
import 'package:megaponto_oficial/Services/feed_service.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  List<Noticia> noticias = List();
  _FeedState() {
    obterNoticia();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CardFeed(lista: noticias, index: index);
      },
      itemCount: noticias.length,
    );
  }

  void obterNoticia() async{
    List<Noticia> noticias2 = await FeedService().obterNoticias();
    setState(() {
      noticias = noticias2;
    });
  }
}
