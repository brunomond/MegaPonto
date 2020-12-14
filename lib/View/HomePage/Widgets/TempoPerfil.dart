import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/perfil_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';
import 'package:megaponto_oficial/View/Utils/TranformaTempo.dart';

class TempoPerfil extends StatefulWidget {
  @override
  _TempoPerfilState createState() => _TempoPerfilState();
}

class _TempoPerfilState extends State<TempoPerfil> {
  PerfilController controller = PerfilController();

  @override
  void initState() {
    controller.carregaTempo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Observer(builder: (_) {
        return Stack(children: <Widget>[
          Positioned(
            left: 16,
            child: Container(child: _tempoSMA(controller.tempoSemana, 'Semanais')),
          ),
          Align(
            alignment: Alignment.center,
            child: _tempoSMA(controller.tempoMes, 'Mensais'),
          ),
          Positioned(
            right: 16,
            child: _tempoSMA(controller.tempoAno, 'Anuais'),
          )
        ]);
      }),
    );
  }

  Widget _tempoSMA(int horasAcumuladas, String sma) {
    return SizedBox(
        height: Globals.windowSize.height * 0.2,
        width: Globals.windowSize.width * 0.23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              TransformaTempo(horasAcumuladas).toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              sma,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}
