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
  int numPessoasOnline = 5;

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        _textOnline(),
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
    return Center(
      child: Column(
        children: [
          Container(
            child: Text(
              textLabel,
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              textTitle,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.transparent,
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
    );
  }

  //Pop-Ups
  createCoffeePopUp(BuildContext coffee) {
    return showDialog(
        context: coffee,
        builder: (coffee) {
          return AlertDialog(
              title: Text("Obrigado pelo café! S2"),
              backgroundColor: Color.fromRGBO(143, 58, 56, 1),
              elevation: 8,
              content: Text(
                  "Desejá mudar o horario do último café para ${DateTime.now()} de hoje?"),
              actions: <Widget>[
                GestureDetector(
                  child: Text("Cancel"),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Text("sim"),
                  onTap: () {},
                )
              ]);
        });
  }

  createEstadoSalaPopUp(BuildContext estadodasala) {
    return showDialog(
        context: estadodasala,
        builder: (estadodasala) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AlertDialog(
                  backgroundColor: Color.fromRGBO(143, 58, 56, 1),
                  actions: <Widget>[
                    GestureDetector(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text("Sala Normal"),
                          Text(
                            "Clima Normal de Trabalho",
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ]),
              AlertDialog(
                  backgroundColor: Color.fromRGBO(143, 58, 56, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  actions: <Widget>[
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text("Reunião da Diretoria"),
                          Text(
                            "Reunião Interna Acontecendo",
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ]),
              AlertDialog(
                  backgroundColor: Color.fromRGBO(143, 58, 56, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  actions: <Widget>[
                    GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Text("Reunião com cliente"),
                          Text(
                            "Reunião Com Cliente Agora",
                            style: TextStyle(
                                fontSize: 20, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ]),
            ],
          );
        });
  }

  Widget _textOnline() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 255, 0, 1),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          ' $numPessoasOnline' + ' MegaMembros na sala :)',
          style: TextStyle(
              fontSize: 23, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _estadoSala() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            createEstadoSalaPopUp(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                CustomIcons.clima_normal,
                size: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
                child: Text(
                  'Clima normal de trabalho',
                  style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: Icon(
                Icons.expand_more,
                size: 32,
              ),
            ),
          ]),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        InkWell(
          onTap: () {
            createCoffeePopUp(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                CustomIcons.cafe,
                size: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 8, 0),
                child: Text(
                  'Café feito às 14:00 de hoje',
                  style: TextStyle(fontSize: 23, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
              child: Icon(
                Icons.expand_more,
                size: 32,
              ),
            ),
          ]),
        ),
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
