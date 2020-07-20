import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_criar_conta.dart';

class EditarPerfil extends StatefulWidget {
  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/abott@adorable.png'),
            ),
          ]),
          Text("Nome Completo"),
          Text("Apelido"),
          Text("Email"),
          Text("Senha"),
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
}
