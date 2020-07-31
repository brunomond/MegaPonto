import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_acesso.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdPrefixIcon.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CriarConta extends StatefulWidget {
  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  var phoneMask = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
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
            style: Globals.textTheme.bodyText1,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 5),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Você está próximo de possuir uma MegaConta e se juntar à galera.",
            style: Globals.textTheme.bodyText2,
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
              hintText: 'Nome Completo',
              prefixIcon: StdPrefixIcon(iconData: Icons.person),
            ).applyDefaults(Globals.inputTheme),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus();
            },
            decoration: InputDecoration(
              hintText: 'E-mail',
              prefixIcon: StdPrefixIcon(
                iconData: Icons.email,
              ),
            ).applyDefaults(Globals.inputTheme),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus();
            },
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Senha',
              suffixIcon: IconButton(
                icon: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: _trocarVisibilidadeSenha,
              ),
              prefixIcon: StdPrefixIcon(
                iconData: Icons.vpn_key,
              ),
            ).applyDefaults(Globals.inputTheme),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus();
            },
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Confirmar Senha',
              suffixIcon: IconButton(
                icon: Icon(isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: _trocarVisibilidadeSenha,
              ),
              prefixIcon: StdPrefixIcon(
                iconData: Icons.vpn_key,
              ),
            ).applyDefaults(Globals.inputTheme),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus();
            },
            decoration: InputDecoration(
              labelText: 'Apelido',
              prefixIcon: StdPrefixIcon(
                iconData: Icons.person_pin,
              ),
            ).applyDefaults(Globals.inputTheme),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (String value) {
              FocusScope.of(context).requestFocus();
            },
            decoration: InputDecoration(
              hintText: "(xx) xxxxx-xxxx",
              prefixIcon: StdPrefixIcon(
                iconData: Icons.phone,
              ),
            ).applyDefaults(Globals.inputTheme),
            inputFormatters: [phoneMask],
          ),
          StdButton(
              padding: EdgeInsets.only(top: 24),
              label: 'Cadastrar',
              onPressed: Access.navega(0, context)),
          Center(
            child: GestureDetector(
              child: Text(
                "Já possui uma conta? Faça seu Login!",
                textAlign: TextAlign.center,
                style: Globals.textTheme.overline,
              ),
              onTap: () => Access.navega(0, context),
            ),
          )
        ],
      ))
    ]);
  }

  void _trocarVisibilidadeSenha() {
    setState(() => isPasswordVisible = !isPasswordVisible);
  }
}
