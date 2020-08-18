import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/Controller/EstadoSalaController.dart';
import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/EstadoSalaDialog.dart';
import 'package:megaponto_oficial/View/Utils/StdDialog.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';
import 'EstadoSelector.dart';
import 'package:intl/date_symbol_data_local.dart';

class EstadoSala extends StatefulWidget {
  @override
  _EstadoSalaState createState() => _EstadoSalaState();
}

class _EstadoSalaState extends State<EstadoSala> {
  EstadoSalaController estadoSalaController = EstadoSalaController();
  EstadoSalaEnum estadoSala = EstadoSalaEnum.NORMAL;
  String horas = "";

  @override
  void initState() {
    super.initState();
    obterSalaCafe();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: EdgeInsets.only(top: Globals.windowSize.height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EstadoSelector(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
              text: estadoSala.title,
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
              text: 'Café feito às $horas',
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

  alterarCafe(BuildContext context) async {
    DateTime timeCofe =
        DateTime.parse(await estadoSalaController.alterarHorarioCafe())
            .toLocal();

    initializeDateFormatting('pt_Br', null);

    setState(() {
      horas = DateFormat.Hm().format(timeCofe) +
          ' de ' +
          DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(timeCofe);
    });

    Navigator.of(context).pop();
  }

  void obterSalaCafe() async {
    Map salaCafeMap = await estadoSalaController.getSalaCafe();
    int sala = int.parse(salaCafeMap['status']);
    DateTime timeCofe = DateTime.parse(salaCafeMap['cafe']).toLocal();

    setState(() {
      horas = DateFormat.Hm().format(timeCofe);
      estadoSala = EstadoSalaEnumExtension.responseData(sala);
    });
  }
}
