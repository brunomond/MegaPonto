import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/feed_noticia_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class NoticiaExpandida extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffold;
  FeedNoticiaController feedController;

  NoticiaExpandida({this.scaffold, this.feedController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child: Align(
            heightFactor: 0.5,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/abott@adorable.png'),
            ),
          ),
        ),
        Text(
          feedController.titulo,
          style: Globals.textTheme.headline6.copyWith(
              color: Globals.theme.primaryColor, fontStyle: FontStyle.normal),
        ),
        Divider(),
        Text(
          feedController.conteudo,
          style: Globals.textTheme.headline6.copyWith(
              color: Globals.theme.primaryColor, fontStyle: FontStyle.normal),
        ),
      ],
    );
  }
}
