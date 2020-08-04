import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/PerfilController.dart';
import 'package:megaponto_oficial/View/Utils/TranformaTempo.dart';

import 'tela_editar_perfil.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  String estadoPatente = "Megariano Bronze";
  PerfilController perfilController = PerfilController();
  int totalSemana = 0;
  int totalMes = 0;
  int totalAno = 0;
  String totalSemanaD;
  String totalMesD;
  String totalAnoD;

  @override
  void initState() {
    super.initState();
    infoPlantao();
  }

  void infoPlantao() async {
    Map parsedJson = await perfilController.pegarInfoPlantao();
    totalSemana = parsedJson['total_semana'];
    totalMes = parsedJson['total_mes'];
    totalAno = parsedJson['total_ano'];
    setState(() {
      totalSemanaD = TransformaTempo(totalSemana);
      totalMesD = TransformaTempo(totalMes);
      totalAnoD = TransformaTempo(totalAno);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        _identificacao(),
        _espacamento(),
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
        _espacamento(),
        _tempoPonto(),
        _espacamento(),
      ],
    );
  }

  Widget _identificacao() {
    return Column(
      children: <Widget>[
        Text(
          "Nome Completo",
          style: TextStyle(fontSize: 28),

        ),
        Text(
          "(Apelido)",
          style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
        ),

      ],
    );
  }

  Widget _tempoPonto() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _tempoSMA('$totalSemanaD', 'Essa Semana'),
        ),
        Expanded(
          flex: 1,
          child: _tempoSMA('$totalMesD', 'Esse Mês'),
        ),
        Expanded(
          flex: 1,
          child: _tempoSMA('$totalAnoD', 'Esse Ano'),
        ),
      ],
    );
  }

  Widget _tempoSMA(String horasAcumuladas, String sma) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width*0.2,
      child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              horasAcumuladas,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              sma,
              style: TextStyle(fontSize: 16),
            ),
          ],
        )
    );
  }

  Widget _espacamento() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
    );
  }

}
