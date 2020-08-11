import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/MembrosController.dart';
import 'package:megaponto_oficial/Controller/PontoController.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
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
  MembrosController membrosController = MembrosController();
  bool loading = true;
  bool started;
  var now = TimeOfDay.now();
  List<Usuario> listUsuariosOnline = List();

  @override
  void initState() {
    super.initState();
    _start();
    buscarMembrosOnline();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListOnline(
          lista: listUsuariosOnline,
        ),
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
        if (value.get('start') == true)
          started = true;
        else
          started = false;
        loading = false;
      });
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
    _showSnack(formatDuration(duracao), false);
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

  void buscarMembrosOnline() async {
    List<Usuario> listUsuariosOnlines =
        await membrosController.listarMembrosOnline();

    setState(() {
      listUsuariosOnline = listUsuariosOnlines;
    });
  }
}
