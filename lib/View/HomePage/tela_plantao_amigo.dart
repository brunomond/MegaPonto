import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/plantao_amigo_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/MembrosCard.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';

class PlantaoAmigo extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  PlantaoAmigo({this.scaffold});

  @override
  _PlantaoAmigoState createState() => _PlantaoAmigoState();
}

class _PlantaoAmigoState extends State<PlantaoAmigo> {
  PlantaoAmigoController controller = PlantaoAmigoController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.loading || controller.membrosEjOutput.data.length == 0)
        return SizedBox(
            height: Globals.windowSize.height,
            width: Globals.windowSize.width,
            child: Loading());

      List<Usuario> membrosEj = controller.membrosEjOutput.data;

      return RefreshIndicator(
          onRefresh: controller.fetchData,
          child: controller.loadingNewState
              ? SizedBox(
                  height: Globals.windowSize.height,
                  width: Globals.windowSize.width,
                  child: Loading())
              : ListView.builder(
                  itemBuilder: (_, index) => MembrosCard(
                      lista: membrosEj,
                      index: index,
                      onTap: () =>
                          controller.alterarPlantao(membrosEj[index], context)),
                  itemCount: membrosEj.length,
                ));
    });
  }
}
