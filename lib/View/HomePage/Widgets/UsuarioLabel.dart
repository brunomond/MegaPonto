import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class UsuarioLabel extends StatefulWidget {
  @override
  _UsuarioLabelState createState() => _UsuarioLabelState();
}

class _UsuarioLabelState extends State<UsuarioLabel> {
  
  String estadoPatente = "Megariano Bronze";
  Usuario user = Globals.sessionController.loggedUser;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
                        backgroundImage:
                            //user.imgUrl != null && user.imgUrl.isNotEmpty
                            //  ? NetworkImage(user.imgUrl)
                            //:
                            AssetImage('images/abott@adorable.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 64,
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/editar_perfil'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              '${user.nome} ${user.sobrenome}',
              style: Globals.textTheme.bodyText1,
            ),
            Text(
              user.nome,
              style: Globals.textTheme.bodyText2
                  .copyWith(fontStyle: FontStyle.italic),
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
                  style: Globals.textTheme.bodyText2
                      .copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            //SE FOR ADMINISTRADOR ENTRA AQUI
            GestureDetector(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.build), Text('Administrador')],
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/adm'),
            )

            //FIM DO SE FOR ADMINISTRADOR ENTRA AQUI
          ],
        );
      },
    );
  }
}
