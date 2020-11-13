import 'package:flutter/material.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';

class AdmEditarPerfil extends StatefulWidget {
  @override
  _AdmEditarPerfilState createState() => _AdmEditarPerfilState();
}

class _AdmEditarPerfilState extends State<AdmEditarPerfil> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Editar Perfil',
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  imagemPerfil(),
                  nomePerfil(),
                  emailPerfil(),
                  senhaPerfil(),
                  StdTextInput(
                    keyboardType: TextInputType.phone,
                    hintText: 'Tel: (xx) xxxxx-xxxx',
                    prefixIcon: Icons.phone,
                    isPhone: true,
                    done: true,
                  ),
                  horasPerfil(),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: null),
                      Text('Administrador'),
                    ],
                  ),
                  StdButton(
                    padding: EdgeInsets.only(top: 24),
                    label: 'Confirmar',
                    onPressed: () => null,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  alterarFotoPopUp(BuildContext context) {
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

  void _trocarVisibilidadeSenha(bool senha) {
    senha
        ? setState(() => isPasswordVisible = !isPasswordVisible)
        : setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible);
  }

  Widget imagemPerfil() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(
              width: 128,
              height: 128,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/abott@adorable.png'),
              )),
        ),
        GestureDetector(
          onTap: () {
            alterarFotoPopUp(context);
          },
          child: Text(
            "Alterar foto de perfil",
            style: Globals.textTheme.headline6.copyWith(
                color: Globals.theme.primaryColor, fontStyle: FontStyle.normal),
          ),
        ),
      ],
    );
  }

  Widget nomePerfil() {
    return Column(
      children: [
        StdTextInput(
          padding: EdgeInsets.fromLTRB(8.0, 16, 8, 8),
          hintText: 'Nome Completo',
          prefixIcon: Icons.person,
        ),
        StdTextInput(
          hintText: 'Apelido',
          prefixIcon: Icons.person_pin,
        ),
      ],
    );
  }

  Widget emailPerfil() {
    return Column(
      children: [
        StdTextInput(
          keyboardType: TextInputType.emailAddress,
          hintText: 'E-mail',
          prefixIcon: Icons.email,
        ),
        StdTextInput(
          keyboardType: TextInputType.emailAddress,
          hintText: 'Confirmar E-mail',
          prefixIcon: Icons.email,
        ),
      ],
    );
  }

  Widget senhaPerfil() {
    return Column(
      children: [
        StdTextInput(
            hintText: 'Senha',
            prefixIcon: Icons.vpn_key,
            obscureText: !isPasswordVisible,
            suffixIcon: IconButton(
              icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off),
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
      ],
    );
  }

  Widget horasPerfil() {
    return StdTextInput(
      prefixIcon: Icons.access_time,
      keyboardType: TextInputType.number,
      isTime: true,
      hintText: 'HH:MM:SS',
    );
  }
}
