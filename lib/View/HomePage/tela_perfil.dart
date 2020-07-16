import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 206,
                height: 206,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                onPressed: () {},
                child: Icon(Icons.edit),
              ),
            )
          ],
        ),
        Text("Nome Completo"),
        Text("(Apelido)"),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("Megamembro Regular"),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Xh"),
            Text("Yh"),
            Text("Zh"),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Essa Semana"),
            Text("Esse Mês"),
            Text("Esse Ano"),
          ],
        ),
      ],
    );
  }
}
