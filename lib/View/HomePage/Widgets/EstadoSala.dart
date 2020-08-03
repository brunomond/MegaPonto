import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/Controller/EstadoSalaController.dart';
import 'package:megaponto_oficial/Resources/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/EstadoSalaDialog.dart';
import 'package:megaponto_oficial/View/Utils/StdDialog.dart';
import 'package:megaponto_oficial/presets/custom_icons_icons.dart';
import 'EstadoSelector.dart';

class EstadoSala extends StatefulWidget {
  @override
  _EstadoSalaState createState() => _EstadoSalaState();
}

class _EstadoSalaState extends State<EstadoSala> {
  EstadoSalaController estadoSalaController = EstadoSalaController();
  EstadoSalaEnum estadoSala = EstadoSalaEnum.NORMAL;
  IconData icon = CustomIcons.clima_normal;
  String horas = "14:00";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: EdgeInsets.only(top: Globals.windowSize.height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Condições de trabalho:",
                style: Globals.textTheme.headline6,
              ),
            ),
            EstadoSelector(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
              text: estadoSala.description,
              icon: estadoSala.icon,
              onTap: () => showDialog(
                  context: context,
                  builder: (context) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: _opcoesPopUp(),
                        ),
                      )),
            ),
            EstadoSelector(
              text: 'Café feito às $horas de hoje',
              icon: CustomIcons.cafe,
              onTap: () => showDialog(
                  context: context,
                  builder: (context) => StdDialog(
                        title: 'Obrigado pelo café! S2',
                        contentText:
                            'Desejá mudar o horario do último café para ' +
                                DateFormat.Hm().format(DateTime.now()) +
                                ' de hoje?',
                        options: {
                          'Cancelar': () => cancelar(context),
                          'Sim': () => alterarCafe(context)
                        },
                      )),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _opcoesPopUp() {
    List<Widget> opcoes = new List<Widget>();

    estadoSala.toList.forEach((element) {
      opcoes.add(EstadoSalaDialog(
        estadoSala: element,
        onTap: () => onTap(element),
      ));
    });

    return opcoes;
  }

  void onTap(EstadoSalaEnum estadoEnum) {
    setState(() {
      estadoSala = estadoEnum;
    });
    estadoSalaController.alterarEstadoSala(estadoEnum);
    Navigator.pop(context);
  }

  cancelar(BuildContext context) {
    Navigator.of(context).pop();
  }

  alterarCafe(BuildContext context) {
    setState(() => horas = DateFormat.Hm().format(DateTime.now()));
    Navigator.of(context).pop();
  }
}
