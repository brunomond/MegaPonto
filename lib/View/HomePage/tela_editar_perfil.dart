import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Perfil"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(143, 58, 56, 1),
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _Espacamento(),
              SizedBox(
                  width: 128,
                  height: 128,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/abott@adorable.png'),
                  )),
              InkWell(
                onTap: () {
                  AlterarFotoPopUp(context);
                },
                child: Text(
                  "Alterar foto de perfil",
                  style: TextStyle(
                      color: Color.fromRGBO(199, 59, 35, 1), fontSize: 20),
                ),
              ),
              _Espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: Globals.windowSize.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(labelText: "Nome"),
                    ),
                  ),
                ],
              ),
              _Espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: Globals.windowSize.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(labelText: "Apelido"),
                    ),
                  ),
                ],
              ),
              Divider(
                height: Globals.windowSize.height * 0.08,
              ),
              Text(
                "Informações do perfil",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              _Espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Container(
                      width: Globals.windowSize.width * 0.8,
                      child: TextField(
                        decoration:
                            InputDecoration(labelText: "Endereço de Email"),
                      ),
                    ),
                  ),
                ],
              ),
              _Espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: Globals.windowSize.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(labelText: "Senha"),
                    ),
                  ),
                ],
              ),
              _Espacamento(),
              Container(
                  width: 200,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(143, 58, 56, 1),
                      borderRadius: BorderRadius.all(Radius.circular(26))),
                  child: FlatButton(
                    child: Text("Concluir",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {},
                  )),
            ],
          ),
        );
      }),
    );
  }

  AlterarFotoPopUp(BuildContext context) {
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

  Widget _Espacamento() {
    return SizedBox(
      height: Globals.windowSize.height * 0.04,
    );
  }
}
