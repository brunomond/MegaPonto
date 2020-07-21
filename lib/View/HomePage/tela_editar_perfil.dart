import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_criar_conta.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pushNamed(context, '/home'),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 128,
                      height: 128,
                      child:CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/abott@adorable.png'),
                    )),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        AlterarFotoPopUp(context);
                      },
                      child: Text(
                        "Alterar foto de perfil",
                        style: TextStyle(
                          color: Color.fromRGBO(199, 59, 35, 1),
                          fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 90,),
              ]),
          Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(labelText: "Apelido"),
                ),
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  decoration: InputDecoration(labelText: "Endereço de Email"),
                ),
              ),
              InkWell(
                child: Icon(Icons.edit),
              )
            ],
          ),
          Row(
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
              InkWell(
                child: Icon(Icons.edit),
              )
            ],
          ),
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
}
