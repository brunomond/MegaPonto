import 'package:flutter/material.dart';

class AdmEdit extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  String editavel;

  AdmEdit({this.scaffold});

  @override
  _AdmEditState createState() => _AdmEditState();
}

class _AdmEditState extends State<AdmEdit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            admOutlineBottom('Editar Funcionário', '/adm_funcio'),
            admOutlineBottom('Editar Aplicativo', '/adm_app'),
            admOutlineBottom('Nova Notícia', '/criar_noticia'),
          ],
        ),
      ),
    );
  }

  Widget admOutlineBottom(String editavel, String page) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      child: OutlineButton(
        onPressed: () => Navigator.pushNamed(context, '$page'),
        child: Text(
          editavel,
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
      ),
    );
  }
}
