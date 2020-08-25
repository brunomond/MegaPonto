import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/Controller/estado_sala_controller.dart';
import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/EstadoSalaDialog.dart';
import 'package:megaponto_oficial/View/Utils/StdDialog.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';
import 'EstadoSelector.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EstadoSala extends StatefulWidget {
  @override
  _EstadoSalaState createState() => _EstadoSalaState();
}

class _EstadoSalaState extends State<EstadoSala> {
  EstadoSalaController controller = EstadoSalaController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: EdgeInsets.only(top: Globals.windowSize.height * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (_) {
              return EstadoSelector(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
                text: controller.estadoSalaEnum.title,
                icon: controller.estadoSalaEnum.icon,
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
              );
            }),
            Observer(builder: (_) {
              return EstadoSelector(
                text: 'Café feito às ' + controller.cafe,
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
                            'Cancelar': () => Navigator.of(context).pop(),
                            'Sim': () => controller.enviarCafe(context)
                          },
                        )),
              );
            }),
          ],
        ),
      ),
    );
  }

  List<Widget> _opcoesPopUp() {
    List<Widget> opcoes = new List<Widget>();

    controller.estadoSalaEnum.toList.forEach((element) {
      opcoes.add(EstadoSalaDialog(
        estadoSala: element,
        onTap: () => onTap(element),
      ));
    });
    return opcoes;
  }

  void onTap(EstadoSalaEnum estadoEnum) {
    controller.enviarEstadoSala(estadoEnum);
    Navigator.pop(context);
  }
}
