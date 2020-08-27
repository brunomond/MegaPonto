import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:megaponto_oficial/Animations/ponto_scroll_physics.dart';
import 'package:megaponto_oficial/Controller/membros_online_controller.dart';
import 'package:megaponto_oficial/Controller/plantao_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdSnackBar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'Widgets/EstadoSala.dart';
import 'Widgets/InfoPlantao.dart';
import 'package:megaponto_oficial/View/Utils/ListOnline.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';
import 'package:intl/intl.dart';

class Ponto extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  Ponto({this.scaffold});

  @override
  _PontoState createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  MembrosOnlineController controller = MembrosOnlineController();
  PlantaoController plantaoController = PlantaoController();
  var now = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.fetchData,
      child: ListView(
        itemExtent: Globals.windowSize.height,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: PontoScrollPhysics(),
        children: [
          Stack(
            children: <Widget>[
              ListOnline(controller: controller),
              Positioned.fill(
                top: Globals.windowSize.height * 0.27,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(50.0),
                          topRight: const Radius.circular(50.0)),
                      color: Colors.white),
                  child: Column(children: [
                    EstadoSala(),
                    Observer(builder: (_) {
                      return plantaoController.loading
                          ? Loading()
                          : Globals.sessionController.pontoAtivo
                              ? InfoPlantao(
                                  label:
                                      'Muito bom, assim que eu gosto de ver!',
                                  buttonLabel: 'Fechar Plantão',
                                  onPressed: _fecharPlantao)
                              : InfoPlantao(
                                  label: 'Partiu entregar alguns projetos?!',
                                  buttonLabel: 'Iniciar Plantão',
                                  onPressed: _iniciarPlantao);
                    }),
                  ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  /* ---------------------------------------------------------------------------------------------------------------
       * --------------------------------------------- FUNCTIONS ------------------------------------------------------- 
       * ---------------------------------------------------------------------------------------------------------------
       */

  //Iniciar / Fechar Plantão
  void _iniciarPlantao() async {
    await plantaoController.iniciarPlantaoUser();

    if (Globals.sessionController.pontoAtivo)
      widget.scaffold.currentState.showSnackBar(StdSnackBar(
          text:
              'Plantão iniciado às ${DateFormat.Hm().format(DateTime.now())}!'));
    else
      widget.scaffold.currentState.showSnackBar(StdSnackBar(text: 'Erro'));
  }

  void _fecharPlantao() async {
    await plantaoController.fecharPlantao();

    if (!Globals.sessionController.pontoAtivo)
      widget.scaffold.currentState.showSnackBar(StdSnackBar(
          text:
              'Duração do plantão: ${formatDuration(plantaoController.duration)}'));
  }
}
