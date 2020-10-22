import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/leaderboard_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/Rank.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class LeaderBoard extends StatefulWidget {
  @override
  _LeaderBoardState createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  LeaderBoardController controller = LeaderBoardController();

  static const length = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.loading || controller.membrosEjOutput.data.length == 0)
        return SizedBox(
            height: Globals.windowSize.height,
            width: Globals.windowSize.width,
            child: Loading());

      return Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 24),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) => pageIndexNotifier.value = index,
                    itemCount: length,
                    itemBuilder: (context, index) {
                      return _cardList(controller.membrosEjOutput.data);
                    },
                  ),
                ),
                _buildExample2(),
              ],
            )),
      );
    });
  }

  Widget _cardList(List lista) {
    return Expanded(
        child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return Rank(lista: lista, index: index, onTap: () {});
            }));
  }

  PageViewIndicator _buildExample2() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => (index == 0)
          ? Text("Semanal")
          : (index == 1)
              ? Text("Mensal")
              : (index == 2) ? Text("Anual") : Container(),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 8.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
