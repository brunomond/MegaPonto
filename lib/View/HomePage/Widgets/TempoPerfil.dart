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
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: <Widget>[
        Positioned(
          left: 16,
          child: Container(
              child: _tempoSMA('$totalSemanaD', 'Semanais')
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: _tempoSMA('$totalMesD', 'Mensais'),
        ),
        Positioned(
          right: 16,
          child: _tempoSMA('$totalAnoD', 'Anuais'),)
    ]),
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
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
            Text(
              sma,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
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
