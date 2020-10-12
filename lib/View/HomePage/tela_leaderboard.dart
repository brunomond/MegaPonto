import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/leaderboard_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class LeaderBoard extends StatelessWidget {
  LeaderBoardController controller = LeaderBoardController();
  List<Usuario> rankingSemanal;
  List<Usuario> rankingMensal;
  List<Usuario> rankingAnual;

  LeaderBoard() {
    obterDados();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 20, 30, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Text('Essa Semana',
                      style: Globals.textTheme.bodyText2
                          .copyWith(decoration: TextDecoration.underline)),
                ),
                GestureDetector(
                  child: Text('Esse Mês',
                      style: Globals.textTheme.bodyText2
                          .copyWith(decoration: TextDecoration.underline)),
                ),
                GestureDetector(
                  child: Text('Esse Ano',
                      style: Globals.textTheme.bodyText2
                          .copyWith(decoration: TextDecoration.underline)),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  void obterDados() async {
    rankingSemanal = await controller.rankingSemanal();
    rankingMensal = await controller.rankingMensal(rankingSemanal);
    rankingAnual = await controller.rankingAnual(rankingSemanal);
  }
}
