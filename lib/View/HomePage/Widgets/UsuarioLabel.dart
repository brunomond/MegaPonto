import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
class UsuarioLabel extends StatelessWidget {

  String estadoPatente = "Megariano Bronze";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, bottom: 16.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 128,
                  width: 128,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/abott@adorable.png'),
                  ),
                ),
              ),
              Positioned(
                right: 64,
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Navigator.pushNamed(context, '/editar_perfil'),
                  ),
                ),
              )
            ],
          ),
        ),
        Text(
          "Nome Completo",
          style: Globals.textTheme.bodyText1,

        ),
        Text(
          "(Apelido)",
          style: Globals.textTheme.bodyText2.copyWith(fontStyle: FontStyle.italic),
        ),
        Padding(
          padding: EdgeInsets.only(top: 64, bottom: 64),
          child: Container(
            width: Globals.windowSize.width * 0.4,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              estadoPatente,
              style: Globals.textTheme.bodyText2.copyWith(fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
