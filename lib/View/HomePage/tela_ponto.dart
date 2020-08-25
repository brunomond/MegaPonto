import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:megaponto_oficial/Animations/ponto_scroll_physics.dart';
import 'package:megaponto_oficial/Controller/PontoController.dart';
import 'package:megaponto_oficial/Controller/membros_online_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/membros_online_service.dart';
import 'package:megaponto_oficial/View/Utils/StdSnackBar.dart';
import 'Widgets/EstadoSala.dart';
import 'Widgets/InfoPlantao.dart';
import 'package:megaponto_oficial/View/Utils/ListOnline.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ponto extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  Ponto({this.scaffold});

  @override
  _PontoState createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  PontoController pontoController = PontoController();
  MembrosOnlineController controller = MembrosOnlineController();
  bool up = false;
  bool loading = true;
  bool started;
  var now = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
   // _start();
  }

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
                    loading
                        ? 
                        Loading()
                        : started
                           ? InfoPlantao(
                               label:
                                   'Muito bom, assim que eu gosto de ver!',
                               buttonLabel: 'Fechar Plantão',
                               onPressed: _fecharPlantao)
                           : InfoPlantao(
                               label: 'Partiu entregar alguns projetos?!',
                               buttonLabel: 'Iniciar Plantão',
                               onPressed: _iniciarPlantao)
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

  //Carregar dados da SharedPreferences
  void _start() async {
    int online = await pontoController.verificarUserOnline();

    setState(() {
      if (online == 1)
        started = true;
      else
        started = false;
      loading = false;
    });
  }

  //Iniciar / Fechar Plantão
  void _iniciarPlantao() async {
    SharedPreferences prefs = await _getSharedInstance();

    DateTime horaInicio = await pontoController.iniciarPlantao();
    setState(() => started = true);
    widget.scaffold.currentState.showSnackBar(StdSnackBar(
        text: 'Plantão iniciado às ${DateFormat.Hm().format(horaInicio)}!'));
    prefs.setBool('start', true);
  }

  void _fecharPlantao() async {
    SharedPreferences prefs = await _getSharedInstance();

    Map parsedJson = await pontoController.fecharPlantao();
    Duration duracao = new Duration(seconds: parsedJson['tempo_online']);
    setState(() => started = false);
    widget.scaffold.currentState.showSnackBar(
        StdSnackBar(text: 'Duração do plantão: ${formatDuration(duracao)}!'));
    prefs.setBool('start', false);
  }

  //Inicializa a Instância da SharedPreferences
  Future<SharedPreferences> _getSharedInstance() async {
    SharedPreferences prefs;
    setState(() {
      loading = true;
    });

    await SharedPreferences.getInstance().then((value) {
      setState(() => loading = false);
      prefs = value;
    });

    return prefs;
  }
}
