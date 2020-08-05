import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/MembrosCard.dart';
import 'package:megaponto_oficial/View/Utils/StdDialog.dart';
import 'package:megaponto_oficial/View/Utils/StdSnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class PlantaoAmigo extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  PlantaoAmigo({this.scaffold});

  @override
  _PlantaoAmigoState createState() => _PlantaoAmigoState();
}

class _PlantaoAmigoState extends State<PlantaoAmigo> {
  List<Usuario> listFuncionarios = List();

  @override
  void initState() {
    super.initState();
    setState(() {
      inserirFuncionarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
          child: Text(
            "Quem está na sala?",
            style: Globals.textTheme.headline5.apply(fontSizeDelta: -4),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
              MembrosCard(lista: listFuncionarios, index: index, onTap: () => confirmPopUp(listFuncionarios[index], context),)
              ],
            );
          },
          itemCount: listFuncionarios.length,
        )),
      ],
    );
  }

  cancelar(BuildContext context) {
    Navigator.of(context).pop();
  }

  alterarStatusFun(Usuario user, BuildContext context) {
    if (user.online)
      _fecharPlantao(user);
    else
      _iniciarPlantao(user);

    Navigator.of(context).pop();
  }

  //Pop-Ups
  confirmPopUp(Usuario user, BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StdDialog(
            contentText: user.online
                ? 'Deseja finalizar o plantão do(a) ${user.nome}?'
                : 'Deseja iniciar o plantão do(a) ${user.nome}?',
            options: {
              'Cancelar': () => cancelar(context),
              'Sim': () => alterarStatusFun(user, context)
            },
          );
        });
  }

  void _iniciarPlantao(Usuario user) async {
    SharedPreferences prefs = await _getSharedInstance();

    String id = user.id.toString();

    prefs
        .setInt(id, DateTime.now().toUtc().millisecondsSinceEpoch)
        .then((value) {
      setState(() => user.online = true);
      widget.scaffold.currentState.showSnackBar(StdSnackBar(
          text:
              'Plantão de ${user.nome} iniciado às ${DateFormat.Hm().format(DateTime.now())}!'));
    });
  }

  void _fecharPlantao(Usuario user) async {
    SharedPreferences prefs = await _getSharedInstance();

    String id = user.id.toString();
    int time = prefs.get(id);
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(time);
    Duration timeOnline = DateTime.now().toUtc().difference(startTime);

    prefs.remove('$user.nome').then((value) {
      setState(() => user.online = false);
      widget.scaffold.currentState.showSnackBar(StdSnackBar(
          text: 'Duração do plantão de ${user.nome}: ${_formatDuration(timeOnline)}'));
    });
  }

  Future<SharedPreferences> _getSharedInstance() async {
    SharedPreferences prefs;

    await SharedPreferences.getInstance().then((value) {
      prefs = value;
    });

    return prefs;
  }

  //Formata a duração para mostrar
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void inserirFuncionarios() {
    Usuario fun1 = Usuario();
    fun1.id = 1;
    fun1.nome = "Bruno Monteiro";
    fun1.online = false;
    fun1.imgUrl = "https://api.adorable.io/avatars/206/abott@exaust.io";
    listFuncionarios.add(fun1);

    Usuario fun2 = Usuario();
    fun2.nome = "Jefferson Henrique";
    fun2.id = 2;
    fun2.online = false;
    fun2.imgUrl =
        "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard";
    listFuncionarios.add(fun2);

    Usuario fun3 = Usuario();
    fun3.id = 3;
    fun3.nome = "José Kazuo";
    fun3.online = false;
    fun3.imgUrl = "https://api.adorable.io/avatars/285/abott@adorable.png";
    listFuncionarios.add(fun3);

    Usuario fun4 = Usuario();
    fun4.id = 4;
    fun4.nome = "Kamylla Nogueira";
    fun4.online = false;
    fun4.imgUrl = "https://api.adorable.io/avatars/206/abott@woman.io";
    listFuncionarios.add(fun4);

    Usuario fun5 = Usuario();
    fun5.id = 5;

    fun5.nome = "Gabriel Martinez";
    fun5.online = false;
    fun5.imgUrl =
        "https://api.adorable.io/avatars/283/abott@power.pngCopy to Clipboard";
    listFuncionarios.add(fun5);

    Usuario fun6 = Usuario();
    fun6.id = 6;
    fun6.nome = "João Victor";
    fun6.online = false;
    fun6.imgUrl = "https://api.adorable.io/avatars/285/abott@ocuped.png";
    listFuncionarios.add(fun6);
  }
}
