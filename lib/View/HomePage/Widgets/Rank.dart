import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';

class Rank extends StatelessWidget {
  final List lista;
  final int index;
  final Function onTap;
  Rank({@required this.lista, @required this.index, @required this.onTap});
  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage('images/abott@adorable.png'),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Text(lista[index].nome),
                      Text(lista[index].total_ano.toString()),
                    ],
                  ),
                )
              ],
            ),
            (index == 0)
                ? Icon(CustomIcons.primeiro)
                : (index == 1)
                    ? Icon(CustomIcons.segundo)
                    : (index == 2) ? Icon(CustomIcons.terceiro) : Container(),
          ],
        ),
      ),
    );
  }
}
