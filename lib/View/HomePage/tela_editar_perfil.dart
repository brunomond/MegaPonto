import 'package:flutter/material.dart';

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
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.done,),
          ),
          SizedBox(width: 8)
        ],
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _espacamento(),
              SizedBox(
                  width: 128,
                  height: 128,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/abott@adorable.png'),
                  )),
              InkWell(
                onTap: () {
                  alterarFotoPopUp(context);
                },
                child: Text(
                  "Alterar foto de perfil",
                  style: TextStyle(
                      color: Color.fromRGBO(199, 59, 35, 1), fontSize: 20),
                ),
              ),
              _espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(labelText: "Nome"),
                    ),
                  ),
                ],
              ),
              _espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(labelText: "Apelido"),
                    ),
                  ),
                ],
              ),
              Divider(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Text(
                "Informações do perfil",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              _espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        decoration:
                            InputDecoration(labelText: "Endereço de Email"),
                      ),
                    ),
                  ),
                ],
              ),
              _espacamento(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(labelText: "Senha"),
                    ),
                  ),
                ],
              ),
            ],
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

  Widget _espacamento() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
    );
  }
}
