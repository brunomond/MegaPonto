import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/leaderboard_controller.dart';
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
  final pageController = PageController(initialPage: 0);

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
            child: Container(
              child: Column(
                children: [
                  _buildExample2(),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (index) async {
                        await controller.alterarList(index);
                        pageIndexNotifier.value = index;
                      },
                      itemCount: length,
                      itemBuilder: (context, index) {
                        return _cardList(
                            controller.membrosEjOutput.value, index);
                      },
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }

  Widget _cardList(List lista, int rank) {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Rank(
            lista: lista,
            index: index,
            onTap: () {},
            rank: rank,
          );
        });
  }

  PageViewIndicator _buildExample2() {
    return PageViewIndicator(
        pageIndexNotifier: pageIndexNotifier,
        length: length,
        normalBuilder: (animationController, index) => ScaleTransition(
              scale: CurvedAnimation(
                parent: animationController,
                curve: Curves.ease,
              ),
              child: (index == 0)
                  ? GestureDetector(
                      onTap: () async {
                        await pageController.animateToPage(0,
                            duration: Duration(seconds: 1), curve: Curves.ease);
                        pageIndexNotifier.value = 0;
                      },
                      child: Text("Semanal"))
                  : (index == 1)
                      ? GestureDetector(
                          onTap: () async {
                            await pageController.animateToPage(1,
                                duration: Duration(seconds: 1),
                                curve: Curves.ease);
                            pageIndexNotifier.value = 1;
                          },
                          child: Text("Mensal"))
                      : (index == 2)
                          ? GestureDetector(
                              onTap: () async {
                                await pageController.animateToPage(2,
                                    duration: Duration(seconds: 1),
                                    curve: Curves.ease);
                                pageIndexNotifier.value = 2;
                              },
                              child: Text("Anual"))
                          : Container(),
            ),
        highlightedBuilder: (animationController, index) {
          return ScaleTransition(
              scale: CurvedAnimation(
                parent: animationController,
                curve: Curves.ease,
              ),
              child: (index == 0)
                  ? Text("Semanal",
                      style: TextStyle(decoration: TextDecoration.underline))
                  : (index == 1)
                      ? Text("Mensal",
                          style:
                              TextStyle(decoration: TextDecoration.underline))
                      : Text("Anual",
                          style:
                              TextStyle(decoration: TextDecoration.underline)));
        });
  }
}
