import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/PerfilController.dart';

import 'tela_editar_perfil.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String estadoPatente = "Megariano Bronze";
  PerfilController perfilController = PerfilController();
  int totalSemana = 0;

  @override
  void initState() {
    super.initState();
    teste();
  }

  void teste() async {
    int teste = await perfilController.pegarInfoPlantaoSemana();
    setState(() {
      totalSemana = teste;
    });
  }

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
        Divider(
          height: MediaQuery.of(context).size.height * 0.02,
          color: Colors.transparent,
        )
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
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            estadoPatente,
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
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
          child: _TempoSMA('$totalSemana', 'Essa Semana'),
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
}
