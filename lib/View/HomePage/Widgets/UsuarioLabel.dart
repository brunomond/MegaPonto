import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_adm.dart';

class UsuarioLabel extends StatelessWidget {
  String estadoPatente = "Megariano Bronze";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: carregaUsuario(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Usuario user = snapshot.data;
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
                                user.imgUrl != null && user.imgUrl.isNotEmpty
                                    ? NetworkImage(user.imgUrl)
                                    : AssetImage('images/abott@adorable.png'),
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
          }
          return Loading();
        });
  }

  Future<Usuario> carregaUsuario() async {
    Usuario user;
    await SharedPreferences.getInstance().then((prefs) {
      String jsonString = prefs.getString(prefs.getString('loginAuth'));
      user = Usuario.fromJson(json.decode(jsonString)['user']);
    });

    return user;
  }
}
