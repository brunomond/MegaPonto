import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/View/Utils/online.dart';
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
      _inserirFuncionariosOnline();
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
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                _listMembros(context, index, listFuncionarios),
              ],
            );
          },
          itemCount: listFuncionarios.length,
        )),
      ],
    );
  }

  Widget _listMembros(BuildContext context, int index, List lista) {
    return Padding(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 10),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300], width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(lista[index].imgUrl),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(lista[index].nome),
                      )
                    ],
                  ),
                  GestureDetector(
                      child: Online(
                          online: lista[index].online, width: 20, heigth: 20),
                      onTap: () {
                        _alterarStatusFun(lista[index]);
                      }),
                ],
              ),
            )));
  }

  void _alterarStatusFun(Usuario user) {
    if (user.online)
      _fecharPlantao(user);
    else
      _iniciarPlantao(user);
  }

  void _iniciarPlantao(Usuario user) async {
    SharedPreferences prefs = await _getSharedInstance();

    prefs
        .setInt('startTime', DateTime.now().toUtc().millisecondsSinceEpoch)
        .then((value) {
      setState(() => user.online = true);
      _showSnack(DateFormat.Hm().format(DateTime.now()), true, user.nome);
    });
  }

  void _fecharPlantao(Usuario user) async {
    SharedPreferences prefs = await _getSharedInstance();

    int time = prefs.get('startTime');
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(time);
    Duration timeOnline = DateTime.now().toUtc().difference(startTime);

    prefs.remove('startTime').then((value) {
      setState(() => user.online = false);
      _showSnack(_formatDuration(timeOnline), false, user.nome);
    });
  }

  //Mostra a snackBar
  void _showSnack(String time, bool start, String nome) {
    SnackBar snackBar;

    snackBar = start
        ? snackBar = new SnackBar(
            content: Text('Plantão do(a) $nome iniciado às $time'),
            duration: Duration(seconds: 2),
          )
        : snackBar = new SnackBar(
            content: Text('Duração do plantão do(a) $nome: $time'),
            duration: Duration(seconds: 2),
          );

    widget.scaffold.currentState.showSnackBar(snackBar);
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

  void _inserirFuncionariosOnline() {
    Usuario fun1 = Usuario();
    fun1.nome = "Bruno Monteiro";
    fun1.online = false;
    fun1.imgUrl = "https://api.adorable.io/avatars/206/abott@exaust.io";
    listFuncionarios.add(fun1);

    Usuario fun2 = Usuario();
    fun2.nome = "Jefferson Henrique";
    fun2.online = false;
    fun2.imgUrl =
        "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard";
    listFuncionarios.add(fun2);

    Usuario fun3 = Usuario();
    fun3.nome = "José Kazuo";
    fun3.online = false;
    fun3.imgUrl = "https://api.adorable.io/avatars/285/abott@adorable.png";
    listFuncionarios.add(fun3);

    Usuario fun4 = Usuario();
    fun4.nome = "Bruno Monteiro";
    fun4.online = false;
    fun4.imgUrl = "https://api.adorable.io/avatars/206/abott@exaust.io";
    listFuncionarios.add(fun4);

    Usuario fun5 = Usuario();
    fun5.nome = "Jefferson Henrique";
    fun5.online = false;
    fun5.imgUrl =
        "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard";
    listFuncionarios.add(fun5);

    Usuario fun6 = Usuario();
    fun6.nome = "José Kazuo";
    fun6.online = false;
    fun6.imgUrl = "https://api.adorable.io/avatars/285/abott@adorable.png";
    listFuncionarios.add(fun6);
  }
}
