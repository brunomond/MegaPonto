import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/leaderboard_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/MembrosCard.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  LeaderBoardController controller = LeaderBoardController();
  List<Usuario> listExibicao;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.loading || controller.membrosEjOutput.data.length == 0)
        return SizedBox(
            height: Globals.windowSize.height,
            width: Globals.windowSize.width,
            child: Loading());

      listExibicao = controller.membrosEjOutput.data;

      return Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        listExibicao.sort(
                            (a, b) => a.total_semana.compareTo(b.total_semana));
                      },
                      child: Text(
                        'Semanal',
                        style: Globals.textTheme.bodyText2
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        listExibicao
                            .sort((a, b) => a.total_mes.compareTo(b.total_mes));
                      },
                      child: Text(
                        'Mensal',
                        style: Globals.textTheme.bodyText2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        listExibicao
                            .sort((a, b) => a.total_ano.compareTo(b.total_ano));
                      },
                      child: Text(
                        'Anual',
                        style: Globals.textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: RefreshIndicator(
                        onRefresh: controller.fetchData,
                        child: controller.loadingNewState
                            ? SizedBox(
                                height: Globals.windowSize.height,
                                width: Globals.windowSize.width,
                                child: Loading())
                            : ListView.builder(
                                itemBuilder: (_, index) => MembrosCard(
                                    lista: listExibicao,
                                    index: index,
                                    onTap: () {}),
                                itemCount: listExibicao.length,
                              )))
              ],
            )),
      );
    });
  }
}
