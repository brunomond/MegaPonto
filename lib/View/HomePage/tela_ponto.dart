import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/EstadoSalaController.dart';
import 'package:megaponto_oficial/Controller/PontoController.dart';
import 'package:megaponto_oficial/Resources/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/presets/custom_icons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ponto extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;
  Ponto({this.scaffold});

  @override
  _PontoState createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  EstadoSalaController estadoSalaController = EstadoSalaController();
  PontoController pontoController = PontoController();
  MembrosController membrosController = MembrosController();

  TextStyle _botaoStyle = TextStyle(color: Colors.white, fontSize: 20);
  bool started = false;
  bool loading = true;
  EstadoSalaEnum estadoSala = EstadoSalaEnum.NORMAL;
  IconData icon = CustomIcons.clima_normal;
  String horas = "14:00";

  var now = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _start();
    membrosController.listarMembrosOnline();
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
      _showSnack(DateFormat.Hm().format(DateTime.now()), true);
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
      _showSnack(_formatDuration(timeOnline), false);
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

//Mostra a snackBar
  void _showSnack(String time, bool start) {
    SnackBar snackBar;

    snackBar = start
        ? snackBar = new SnackBar(
            content: Text('Plantão iniciado às $time'),
            duration: Duration(seconds: 2),
          )
        : snackBar = new SnackBar(
            content: Text('Duração do plantão: $time'),
            duration: Duration(seconds: 2),
          );

    widget.scaffold.currentState.showSnackBar(snackBar);
  }

//Formata a duração para mostrar
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
