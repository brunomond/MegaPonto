import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';

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
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("images/logo_mega_simbolo.png"),
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
        Form(
          child: Column(
            children: <Widget>[
              TextFormField(
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
              TextFormField(
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
              TextFormField(
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
              TextFormField(
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
              TextFormField(
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
              TextFormField(
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
              TextFormField(
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
              Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius:
                    BorderRadius.all(Radius.circular(32))),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () => Access.navega(0, context),
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
                  onPressed:() => Access.navega(0, context),
                ),
              )
            ],
          ))
      ]);
  }
}
