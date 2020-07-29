import 'package:flutter/material.dart';
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
  TextStyle _botaoStyle = TextStyle(color: Colors.white, fontSize: 20);
  bool started = false;
  bool loading = true;
  String estadoSala = "Clima normal de trabalho";
  IconData icon = CustomIcons.clima_normal;
  String horas = "14:00";

  var now = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Divider(
          height: MediaQuery.of(context).size.height * 0.06,
          color: Colors.transparent,
        ),
        _estadoSala(),
        loading
            ? Loading()
            : started
                ? _infoPlantao('Muito bom, assim que eu gosto de ver!',
                    'Finalize seu Plantão!', 'Fechar Plantão', _fecharPlantao)
                : _infoPlantao('Partiu entregar alguns projetos?!',
                    'Iniciar seu Plantão!', 'Iniciar Plantão', _iniciarPlantao)
      ],
    );
  }

  /* ---------------------------------------------------------------------------------------------------------------
   * --------------------------------------------- WIDGETS --------------------------------------------------------- 
   * ---------------------------------------------------------------------------------------------------------------
   */

  //Iniciar / Fechar Plantão
  Widget _infoPlantao(String textLabel, String textTitle, String textButton,
      Function onPressed) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                textLabel,
                style: TextStyle(
                    fontSize: 21,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Segoe UI'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                textTitle,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Segoe UI'),
              ),
            ),
            Divider(
              color: Colors.transparent,
              height: 20,
            ),
            Container(
                width: 200,
                height: 55,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(143, 58, 56, 1),
                    borderRadius: BorderRadius.all(Radius.circular(26))),
                child: FlatButton(
                  child: Text(textButton, style: _botaoStyle),
                  onPressed: () async => onPressed(),
                )),
          ],
        ),
      ),
    );
  }

  //Pop-Ups
  createCoffeePopUp(BuildContext coffee) {
    return showDialog(
        context: coffee,
        builder: (coffee) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              title: Text("Obrigado pelo café! S2",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromRGBO(143, 58, 56, 1),
              elevation: 8,
              content: Text(
                  'Desejá mudar o horario do último café para ' +
                      DateFormat.Hm().format(DateTime.now()) +
                      ' de hoje?',
                  style: TextStyle(color: Colors.white)),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("Sim",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  onPressed: () {
                    setState(() {
                      horas = DateFormat.Hm().format(DateTime.now());
                    });
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }

  createEstadoSalaPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                  backgroundColor: Color.fromRGBO(143, 58, 56, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  actions: <Widget>[
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcons.clima_normal,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Sala Normal",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    "Clima Normal de Trabalho",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        alterarSala(1);
                        Navigator.pop(context);
                      },
                    ),
                  ]),
              AlertDialog(
                  backgroundColor: Color.fromRGBO(143, 58, 56, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  actions: <Widget>[
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcons.diretoria,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Reunião da Diretoria",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    "Reunião Interna em Andamento",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        alterarSala(2);
                        Navigator.pop(context);
                      },
                    ),
                  ]),
              AlertDialog(
                  backgroundColor: Color.fromRGBO(143, 58, 56, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  actions: <Widget>[
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Icon(
                                CustomIcons.cliente,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "Reunião com Cliente",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Text(
                                    "Reunião com Cliente em Andamento",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        alterarSala(3);
                        Navigator.pop(context);
                      },
                    ),
                  ]),
            ],
          );
        });
  }

  Widget _estadoSala() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            "Condições de trabalho:",
            style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
                fontFamily: 'Segoe UI'),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: InkWell(
            onTap: () {
              createEstadoSalaPopUp(context);
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      icon,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      estadoSala,
                      style: TextStyle(
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Segoe UI'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.expand_more,
                      size: 32,
                    ),
                  )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: InkWell(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      CustomIcons.cafe,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Café feito às $horas de hoje',
                      style: TextStyle(
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Segoe UI'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.expand_more,
                      size: 32,
                    ),
                  )
                ]),
            onTap: () {
              createCoffeePopUp(context);
            },
          ),
        )
      ],
    );
  }

  /* ---------------------------------------------------------------------------------------------------------------
   * --------------------------------------------- FUNCTIONS ------------------------------------------------------- 
   * ---------------------------------------------------------------------------------------------------------------
   */

  //APegar estado da sala
  void alterarSala(int value) {
    setState(() {
      switch (value) {
        case 1:
          estadoSala = "Clima normal de trabalho";
          icon = CustomIcons.clima_normal;
          break;
        case 2:
          estadoSala = "Reunião da Diretoria";
          icon = CustomIcons.diretoria;
          break;
        case 3:
          estadoSala = "Reunião com Cliente";
          icon = CustomIcons.cliente;
          break;
      }
    });
  }

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
