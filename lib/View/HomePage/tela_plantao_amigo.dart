import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/PlantaoAmigoController.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/MembrosCard.dart';
import 'package:megaponto_oficial/View/Utils/StdDialog.dart';
import 'package:megaponto_oficial/View/Utils/StdSnackBar.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';
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
  PlantaoAmigoController plantaoAmigoController = PlantaoAmigoController();

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
                MembrosCard(
                  lista: listFuncionarios,
                  index: index,
                  onTap: () => confirmPopUp(listFuncionarios[index], context),
                )
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
    plantaoAmigoController.iniciarAmigo(user.id);
  }

  void _fecharPlantao(Usuario user) async {
    plantaoAmigoController.fecharAmigo(user.id);
  }

  Future<SharedPreferences> _getSharedInstance() async {
    SharedPreferences prefs;

    await SharedPreferences.getInstance().then((value) {
      prefs = value;
    });

    return prefs;
  }

  void inserirFuncionarios() async {
    List<Usuario> listUsuario = await plantaoAmigoController.mostrarAmigos();
    setState(() {
      listFuncionarios = listUsuario;
    });
  }
}
