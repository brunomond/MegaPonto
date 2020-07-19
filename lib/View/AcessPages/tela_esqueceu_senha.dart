import 'package:flutter/material.dart';

class EsqueceuSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 120,
          height: 120,
          child: Image.asset("images/esqueceu_senha.png"),
        ),
        Text(
          "Esqueceu sua senha?",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black87,
              fontSize: 28
          ),
        ),
        SizedBox(
          width: 300,
          child: Text(
            "Por favor, informe o E-mail associado à sua conta que inviaremos um link para restauração de sua senha.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 12
            ),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'E-mail',
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding:
              EdgeInsets.fromLTRB(20, 10, 20, 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32)),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
              )),
          style: TextStyle(fontSize: 15),
        ),
        Padding(
          padding: EdgeInsets.only(right: 80, left: 80),
          child: Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius:
                BorderRadius.all(Radius.circular(32))),
            child: SizedBox.expand(
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Enviar",
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
            onPressed:() => Navigator.pushNamed(context, 'login'),
          ),
        )
      ],
    );
  }
}