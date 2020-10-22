import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Controller/membros_online_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';

class ListOnline extends StatelessWidget {
  final MembrosOnlineController controller;

  ListOnline({this.controller});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
          padding: EdgeInsets.only(top: Globals.windowSize.height * 0.065),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: Globals.windowSize.height * 0.14,
                  child: Observer(builder: (_) {
                    if (controller.loading) return Loading(color: Colors.white);

                    List<Usuario> membrosOnline =
                        controller.membrosOnlineOutput.data;
                    return RefreshIndicator(
                      onRefresh: controller.fetchData,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            membrosOnline != null ? membrosOnline.length : 0,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [_itemListOnline(membrosOnline[index])],
                          );
                        },
                      ),
                    );
                  })),
              Observer(builder: (_) {
                return Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: _textOnline(controller.qtdOnline));
              })
            ],
          )),
    );
  }

  Widget _itemListOnline(Usuario user) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/abott@adorable.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(user.nome, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }

  Widget _textOnline(int quantidade) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 255, 0, 1),
            shape: BoxShape.circle,
          ),
        ),
        Text(
          ' $quantidade MegaMembros na sala :)',
          style: TextStyle(
              fontSize: 21, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
