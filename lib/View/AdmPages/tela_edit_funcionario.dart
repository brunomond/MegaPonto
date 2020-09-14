import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AdmPages/WidgetsAdm/MembrosCrud.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/plantao_amigo_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';

class EditarFuncionario extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffold;

  EditarFuncionario({this.scaffold});

  @override
  _EditarFuncionarioState createState() => _EditarFuncionarioState();
}

class _EditarFuncionarioState extends State<EditarFuncionario> {
  PlantaoAmigoController controller = PlantaoAmigoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      body: Observer(
        builder: (_) {
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
                      itemBuilder: (_, index) => MembrosCrud(
                        lista: membrosEj,
                        index: index,
                      ),
                      itemCount: membrosEj.length,
                    ));
        },
      ),
    );
  }
}
