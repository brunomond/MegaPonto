import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/online.dart';

class MembrosCard extends StatelessWidget {
  final List lista;
  final int index;
  final Function onTap;
  MembrosCard(
      {@required this.lista, @required this.index, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey[300], width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/abott@adorable.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(lista[index].nome),
                      )
                    ],
                  ),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Online(
                            online: lista[index].online, width: 20, heigth: 20),
                      ),
                      onTap: onTap),
                ],
              ),
            )));
  }
}
