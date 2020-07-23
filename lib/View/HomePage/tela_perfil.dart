import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tela_editar_perfil.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String estadoPatente = "Megariano Bronze";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            SizedBox(
              height: 128,
              width: 128,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/abott@adorable.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditarPerfil()));
                },
                child: Icon(Icons.edit),
              ),
            )
          ],
        ),
        _Identificacao(),
        Divider(
          height: MediaQuery.of(context).size.height * 0.05,
          color: Colors.transparent,
        ),
        _TempoPonto(),
      ],
    );
  }

  Widget _Identificacao() {
    return Column(
      children: <Widget>[
        Text(
          "Nome Completo",
          style: TextStyle(fontSize: 28),
        ),
        Divider(
          height: MediaQuery.of(context).size.height * 0.05,
          color: Colors.transparent,
        ),
        Text(
          "(Apelido)",
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),
        Divider(
          height: MediaQuery.of(context).size.height * 0.05,
          color: Colors.transparent,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                estadoPatente,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
            Expanded(
                flex: 1,
                child: FlatButton(
                  onPressed: () {
                    PatentePopUp(context);
                  },
                  child: Icon(Icons.edit),
                )),
          ],
        ),
      ],
    );
  }

  Widget _TempoPonto() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _TempoSMA('S h', 'Essa Semana'),
        ),
        Expanded(
          flex: 1,
          child: _TempoSMA('M h', 'Esse Mês'),
        ),
        Expanded(
          flex: 1,
          child: _TempoSMA('A h', 'Esse Ano'),
        ),
      ],
    );
  }

  Widget _TempoSMA(String HorasAcumuladas, String SMA) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          HorasAcumuladas,
          style: TextStyle(fontSize: 22),
        ),
        Text(
          SMA,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  PatentePopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            title: Text("Ateração de Patente",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Color.fromRGBO(143, 58, 56, 1),
            elevation: 8,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  child: Text("Megariano Bronze", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    alterarPatente(1);
                    Navigator.pop(context);},
                ),
                FlatButton(
                  child: Text("Megariano Prata", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    alterarPatente(2);
                    Navigator.pop(context);},
                ),
                FlatButton(
                  child: Text("Megariano Ouro", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    alterarPatente(3);
                    Navigator.pop(context);},
                ),
                FlatButton(
                  child: Text("Megariano Platina", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    alterarPatente(4);
                    Navigator.pop(context);},
                ),
                FlatButton(
                  child: Text("Megariano Diamante", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    alterarPatente(5);
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Megariano Mega", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    alterarPatente(6);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  void alterarPatente(int value){
    setState(() {
      switch (value){
        case 1:
          estadoPatente = "Megariano Bronze";
          break;
        case 2:
          estadoPatente = "Megariano Prata";
          break;
        case 3:
          estadoPatente = "Megariano Ouro";
          break;
        case 4:
          estadoPatente = "Megariano Platina";
          break;
        case 5:
          estadoPatente = "Megariano Diamante";
          break;
        case 6:
          estadoPatente = "Megariano Mega";
          break;
      }
    });
  }
}
