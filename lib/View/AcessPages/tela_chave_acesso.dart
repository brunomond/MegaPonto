import 'package:flutter/material.dart';

class ChaveAcesso extends StatefulWidget {
  @override
  _ChaveAcessoState createState() => _ChaveAcessoState();
}

class _ChaveAcessoState extends State<ChaveAcesso> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("images/pato_projeto.png"),
        ),
        Text(
          "Qual a sua chave de acesso?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 26,
          ),
        ),
        TextFormField(
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
        Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius:
              BorderRadius.all(Radius.circular(32))),
          child: SizedBox.expand(
            child: FlatButton(
              onPressed: () => Navigator.pushNamed(context, 'chave_acesso'),
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
            onPressed:() => Navigator.pushNamed(context, '/login'),
          ),
        ),
      ],
    );
  }
}
