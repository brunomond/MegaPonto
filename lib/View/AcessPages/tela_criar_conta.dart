import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/user_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';

class CriarConta extends StatefulWidget {
    
  final int ejId;
  CriarConta({this.ejId});

  @override
  _CriarContaState createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  UserController controller = UserController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    controller.user.empresas_juniore_id = widget.ejId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("images/logo_mega_simbolo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Registre-se",
                  style: Globals.textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Você está próximo de possuir uma MegaConta e se juntar à galera.",
                  style: Globals.textTheme.bodyText2,
                ),
              ),
            ),
            Form(
                child: Column(children: <Widget>[
              StdTextInput(
                padding: EdgeInsets.fromLTRB(8.0, 16, 8, 8),
                hintText: 'Nome',
                prefixIcon: Icons.person,
                onChanged: (value) => controller.user.nome = value,
              ),
              StdTextInput(
                hintText: 'Sobrenome',
                prefixIcon: Icons.person,
                onChanged: (value) => controller.user.sobrenome = value,
              ),
              StdTextInput(
                keyboardType: TextInputType.emailAddress,
                hintText: 'E-mail',
                prefixIcon: Icons.email,
                onChanged: (value) => controller.user.email = value,
              ),
              StdTextInput(
                  hintText: 'Senha',
                  prefixIcon: Icons.vpn_key,
                  obscureText: !isPasswordVisible,
                  onChanged: controller.setPassword,
                  suffixIcon: IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () => _trocarVisibilidadeSenha(true),
                  )),
              StdTextInput(
                hintText: 'Confirmar Senha',
                prefixIcon: Icons.vpn_key,
                obscureText: !isConfirmPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(isConfirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () => _trocarVisibilidadeSenha(false),
                ),
              ),
              StdTextInput(
                hintText: 'Apelido',
                prefixIcon: Icons.person_pin,
                onChanged: (value) => controller.user.apelido = value,
              ),
              StdTextInput(
                keyboardType: TextInputType.number,
                hintText: 'CPF',
                prefixIcon: Icons.fingerprint,
                isCpf: true
              ),
              StdTextInput(
                keyboardType: TextInputType.phone,
                hintText: 'Tel: (xx) xxxxx-xxxx',
                prefixIcon: Icons.phone,
                onChanged: (value) => controller.user.celular = value,
                isPhone: true
              ),
              StdTextInput(
                keyboardType: TextInputType.number,
                hintText: 'Data de nascimento',
                prefixIcon: Icons.calendar_today,
                onChanged: (value) => controller.user.nascimento = value,
                isDate: true,
                done: true,
              ),
              StdButton(
                  padding: EdgeInsets.only(top: 24),
                  label: 'Cadastrar',
                  onPressed: () => Navigator.of(context).pop()),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16.0),
                child: Center(
                  child: GestureDetector(
                      child: Text(
                        "Já possui uma conta? Faça seu Login!",
                        textAlign: TextAlign.center,
                        style: Globals.textTheme.overline,
                      ),
                      onTap: () => Navigator.of(context).pop()),
                ),
              ),
            ]))
          ]),
        ),
      ),
    );
  }

  void _trocarVisibilidadeSenha(bool senha) {
    senha
        ? setState(() => isPasswordVisible = !isPasswordVisible)
        : setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible);
  }
}
