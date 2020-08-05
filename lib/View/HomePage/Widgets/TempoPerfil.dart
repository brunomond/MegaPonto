import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/PerfilController.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/TranformaTempo.dart';


class TempoPerfil extends StatefulWidget {
  @override
  _TempoPerfilState createState() => _TempoPerfilState();
}

class _TempoPerfilState extends State<TempoPerfil> {

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

  @override
  Widget build(BuildContext context) {
    return  Row(
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
        height: Globals.windowSize.height*0.2,
        width: Globals.windowSize.width*0.2,
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

  void infoPlantao() async {
    await perfilController.pegarInfoPlantao().then((parsedJson) {
      totalSemana = parsedJson['total_semana'];
      totalMes = parsedJson['total_mes'];
      totalAno = parsedJson['total_ano'];

      setState(() {
        totalSemanaD = TransformaTempo(totalSemana);
        totalMesD = TransformaTempo(totalMes);
        totalAnoD = TransformaTempo(totalAno);
      });
    });
  }
}
