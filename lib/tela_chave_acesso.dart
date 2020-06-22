import 'package:flutter/material.dart';
import 'main.dart';
import 'package:megaponto_oficial/tela_criar_conta.dart';

class ChaveAcesso extends StatefulWidget {
  @override
  _ChaveAcessoState createState() => _ChaveAcessoState();
}

class _ChaveAcessoState extends State<ChaveAcesso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Image.asset("images/fundo_principal.png"),
                Positioned(
                  top: 100,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            topRight: Radius.circular(90)
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset("images/pato_projeto.png"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60,
                          child: Text(
                            "Qual a sua chave de acesso?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 10
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30,right: 30),
                          child: Material(
                            elevation: 5,
                            shadowColor: Colors.grey,
                            borderRadius: BorderRadius.circular(32),
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
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 90, left: 90),
                          child: Container(
                            height: 60,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                BorderRadius.all(Radius.circular(32))),
                            child: SizedBox.expand(
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              CriarConta()));
                                },
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
                            onPressed:() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Login()));
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
