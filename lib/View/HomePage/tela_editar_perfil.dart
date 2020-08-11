import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(text: 'Editar Perfil', actions: <Widget>[
        IconButton(
          icon: Icon(Icons.done, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
//        SizedBox(width: 8)
      ],),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SizedBox(
                        width: 128,
                        height: 128,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/abott@adorable.png'),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      alterarFotoPopUp(context);
                    },
                    child: Text(
                      "Alterar foto de perfil",
                      style: Globals.textTheme.headline6.copyWith(color: Globals.theme.primaryColor, fontStyle: FontStyle.normal),
                    ),
                  ),

                  StdTextInput(padding: EdgeInsets.fromLTRB(8, 24, 8, 8),hintText: 'Nome',),
                  StdTextInput(hintText: 'Apelido',),
                  Divider(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Text(
                    "Informações do perfil",
                    style: Globals.textTheme.headline6,
                  ),
                  StdTextInput(padding: EdgeInsets.fromLTRB(8, 24, 8, 8),hintText: 'E-mail',),
                  StdTextInput(hintText: 'Senha', done: true,),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
  alterarFotoPopUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24))),
              title: Text("Alterar foto do perfil",
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromRGBO(143, 58, 56, 1),
              elevation: 8,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Divider(),
                  FlatButton(
                      onPressed: null,
                      child: Text(
                        "Nova foto de Perfil",
                        style: TextStyle(color: Colors.white),
                      )),
                  FlatButton(
                      onPressed: null,
                      child: Text(
                        "Remover foto de Perfil",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ));
        });
  }
}
