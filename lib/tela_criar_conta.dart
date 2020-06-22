import 'package:flutter/material.dart';
import 'package:megaponto_oficial/main.dart';
import 'package:megaponto_oficial/tela_home.dart';

class CriarConta extends StatefulWidget {
  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  int sistem = 1;

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1080,
              child: Stack(
                children: <Widget>[
                  Image.asset("images/fundo_principal.png"),
                  Positioned(
                    top: 100,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height + 380,
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
                            height: 100,
                            width: 100,
                            child: Image.asset("images/logo_mega_simbolo.png"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Registre-se",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black87
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: 300,
                              child: Text(
                                "Você está próximo de possuir uma MegaConta e se juntar à galera.",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Nome',
                                        //prefixIcon: Icon(Icons.email),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Sobrenome',
                                        //prefixIcon: Icon(Icons.email),
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'E-mail',
                                      //prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    obscureText: !isPasswordVisible,
                                    decoration: InputDecoration(
                                        labelText: 'Senha',
                                        suffixIcon: IconButton(
                                          icon: Icon(isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              isPasswordVisible = !isPasswordVisible;
                                            });
                                          },
                                        )
                                      //prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    obscureText: !isPasswordVisible,
                                    decoration: InputDecoration(
                                        labelText: 'Confirmar Senha',
                                        suffixIcon: IconButton(
                                          icon: Icon(isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off
                                          ),
                                          onPressed: (){
                                            setState(() {
                                              isPasswordVisible = !isPasswordVisible;
                                            });
                                          },
                                        )
                                      //prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Apelido',
                                      //prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String value) {
                                      FocusScope.of(context).requestFocus();
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Telefone',
                                      hintText: "(xx) xxxxx-xxxx",
                                      hintStyle: TextStyle(color: Colors.grey)
                                      //prefixIcon: Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Sistema Operacional",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            value: 1,
                                            groupValue: sistem,
                                            activeColor: Colors.deepOrange,
                                            onChanged: (T){
                                              print(T);
                                              setState(() {
                                                sistem = T;
                                              });
                                            },
                                          ),
                                          Text("IOS", style: TextStyle(
                                            fontSize: 16
                                          )),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Radio(
                                            value: 2,
                                            groupValue: sistem,
                                            activeColor: Colors.purple,
                                            onChanged: (T){
                                              print(T);
                                              setState(() {
                                                sistem = T;
                                              });
                                            },
                                          ),
                                          Text("Android",style: TextStyle(
                                              fontSize: 16
                                          ),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: 50,
                                        width: 120,
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
                                                          Home()));
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "Criar",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 20),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: FlatButton(
                                    child: Text(
                                      "Já possui uma conta? Faça seu Login!",
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
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
