import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';

class ChaveAcesso extends StatefulWidget {
  @override
  _ChaveAcessoState createState() => _ChaveAcessoState();
}

class _ChaveAcessoState extends State<ChaveAcesso> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset("images/pato_projeto.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "Qual a sua chave de acesso?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 26,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Chave de Acesso',
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding:
                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.grey,
                    ),
                  )),
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.5,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius:
                  BorderRadius.all(Radius.circular(32))),
              child: SizedBox.expand(
                child: FlatButton(
                  onPressed: () => Access.navega(3, context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Confirmar",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: FlatButton(
              child: Text(
                "cancelar",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13
                ),
              ),
              onPressed:() => Access.navega(0, context),
            ),
          ),
        ],
      ),
    );
  }
}
