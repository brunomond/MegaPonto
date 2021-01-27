import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/feed_noticia_controller.dart';
import 'package:megaponto_oficial/Model/noticia.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/cardFeed.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  FeedNoticiaController feedController = FeedNoticiaController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      List<Noticia> noticias = feedController.noticiasEjOutput.data;

      return ListView.builder(
        itemBuilder: (context, index) {
          return CardFeed(
              lista: noticias, index: index, controller: feedController);
        },
        itemCount: noticias.length,
      );
    });
  }
}
