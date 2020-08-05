import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/MembrosController.dart';
import 'package:megaponto_oficial/Controller/PontoController.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdSnackBar.dart';
import 'Widgets/EstadoSala.dart';
import 'Widgets/InfoPlantao.dart';
import 'package:megaponto_oficial/View/Utils/ListOnline.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';

class Ponto extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  Ponto({this.scaffold});

  @override
  _PontoState createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  PontoController pontoController = PontoController();
  MembrosController membrosController = MembrosController();
  bool loading = true;
  bool started;
  var now = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _start();
//    membrosController.listarMembrosOnline();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListOnline(),
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
                  ? Loading()
                  : started
                      ? InfoPlantao(
                          label: 'Muito bom, assim que eu gosto de ver!',
                          title: 'Finalize seu Plantão!',
                          buttonLabel: 'Fechar Plantão',
                          onPressed: _fecharPlantao)
                      : InfoPlantao(
                          label: 'Partiu entregar alguns projetos?!',
                          title: 'Iniciar seu Plantão!',
                          buttonLabel: 'Iniciar Plantão',
                          onPressed: _iniciarPlantao)
            ]),
          ),
        )
      ],
    );
  }

  /* ---------------------------------------------------------------------------------------------------------------
   * --------------------------------------------- FUNCTIONS ------------------------------------------------------- 
   * ---------------------------------------------------------------------------------------------------------------
   */

  //Carregar dados da SharedPreferences
  void _start() async {
    await _getSharedInstance().then((value) {
      setState(() {
        started = value.get('startTime') != null;
        loading = false;
      });
    });
  }

  //Iniciar / Fechar Plantão
  void _iniciarPlantao() async {
    SharedPreferences prefs = await _getSharedInstance();

    prefs
        .setInt('startTime', DateTime.now().toUtc().millisecondsSinceEpoch)
        .then((value) {
      setState(() => started = true);
      widget.scaffold.currentState.showSnackBar(StdSnackBar(text: 'Plantão iniciado às ${DateFormat.Hm().format(DateTime.now())}!'));
    });

    pontoController.iniciarPlantao();
  }

  void _fecharPlantao() async {
    SharedPreferences prefs = await _getSharedInstance();

    int time = prefs.get('startTime');
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(time);
    Duration timeOnline = DateTime.now().toUtc().difference(startTime);

    prefs.remove('startTime').then((value) {
      setState(() => started = false);
      widget.scaffold.currentState.showSnackBar(StdSnackBar(text: 'Duração do plantão: ${formatDuration(timeOnline)}'));
    });

    pontoController.fecharPlantao();
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
