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
                        setState(() {
                          listExibicao.sort((a, b) =>
                              a.total_semana.compareTo(b.total_semana));
                        });
                      },
                      child: Text(
                        'Semanal',
                        style: Globals.textTheme.bodyText2
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listExibicao.sort(
                              (a, b) => a.total_mes.compareTo(b.total_mes));
                        });
                      },
                      child: Text(
                        'Mensal',
                        style: Globals.textTheme.bodyText2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listExibicao.sort(
                              (a, b) => a.total_ano.compareTo(b.total_ano));
                        });
                      },
                      child: Text(
                        'Anual',
                        style: Globals.textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                _cardList()
              ],
            )),
      );
    });
  }

  Widget _cardList() {
    return Expanded(
        child: ListView.builder(
            itemCount: listExibicao.length,
            itemBuilder: (context, index) {
              return _widgetLista(context, index);
            }));
  }

  Widget _widgetLista(BuildContext contexto, int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 29),
                  ),
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://api.adorable.io/avatars/285/abott@adorable.png"),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Text(listExibicao[index].nome),
                      Text(listExibicao[index].total_ano.toString()),
                    ],
                  ),
                )
              ],
            ),
            (index == 0) ? Icon(CustomIcons.primeiro) : Text("nao e primeiro"),
          ],
        ),
      ),
    );
  }
}
