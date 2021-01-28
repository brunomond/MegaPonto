import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:megaponto_oficial/Controller/perfil_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/Utils/StdTextInput.dart';
import 'package:megaponto_oficial/View/Utils/StdButton.dart';

class AdmEditarPerfil extends StatefulWidget {
  @override
  _AdmEditarPerfilState createState() => _AdmEditarPerfilState();

  final Usuario user;

  AdmEditarPerfil({this.user});
}

class _AdmEditarPerfilState extends State<AdmEditarPerfil> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  var focusNode = new FocusNode();

  PerfilController admperfil;

  Usuario usuario = Usuario();

  @override
  void initState() {
    usuario = widget.user;
    admperfil = PerfilController(user: usuario);
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
            onPressed: () => salvar(),
          ),
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Observer(builder: (_) {
            return Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    imagemPerfil(),
                    nomePerfil(admperfil.nome),
                    emailPerfil(admperfil.email),
                    senhaPerfil(),
                    StdTextInput(
                      keyboardType: TextInputType.phone,
                      hintText: 'Tel: (xx) xxxxx-xxxx',
                      prefixIcon: Icons.phone,
                      initualValue: admperfil.celular,
                      isPhone: true,
                      done: true,
                      onSaved: (value) => _celular(value),
                    ),
                    horasPerfil(admperfil.tempoMes),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: null),
                        Text('Administrador'),
                      ],
                    ),
                    StdButton(
                      padding: EdgeInsets.only(top: 24),
                      label: 'Confirmar',
                      onPressed: () => salvar(),
                    )
                  ],
                ),
              ),
            );
          }),
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
                  TextButton(
                      onPressed: (){adicionaImagem();},
                      child: Text(
                        "Nova foto de Perfil",
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton(
                      onPressed: null,
                      child: Text(
                        "Remover foto de Perfil",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ));
        });
  }

  Future<void> adicionaImagem() async{
    final ImagePicker picker = ImagePicker();
  }

  void _trocarVisibilidadeSenha(bool senha) {
    senha
        ? setState(() => isPasswordVisible = !isPasswordVisible)
        : setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible);
  }

  void _celular(String value) {
    setState(() => admperfil.celular = value);
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

  Widget nomePerfil(String nome) {
    return Column(
      children: [
        StdTextInput(
          padding: EdgeInsets.fromLTRB(8.0, 16, 8, 8),
          hintText: 'Nome Completo',
          initualValue: nome,
          onChanged: admperfil.setNome,
          prefixIcon: Icons.person,
        ),
        StdTextInput(
          hintText: 'Apelido',
          prefixIcon: Icons.person_pin,
        ),
      ],
    );
  }

  Widget emailPerfil(String email) {
    return Column(
      children: [
        StdTextInput(
          keyboardType: TextInputType.emailAddress,
          hintText: 'E-mail',
          initualValue: email,
          onChanged: admperfil.setEmail,
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
            onChanged: admperfil.setSenha,
            suffixIcon: IconButton(
              icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => _trocarVisibilidadeSenha(true),
            )),
        StdTextInput(
          hintText: 'Confirmar Senha',
          prefixIcon: Icons.vpn_key,
          obscureText: !isConfirmPasswordVisible,
          erroTexto: admperfil.confirmacaoErrada,
          focusNode: focusNode,
          onChanged: admperfil.setConfirmacaoSenha,
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

  Widget horasPerfil(int horas) {
    return StdTextInput(
      prefixIcon: Icons.access_time,
      keyboardType: TextInputType.number,
      isTime: true,
      hintText: 'HH:MM:SS',
      initualValue: formatDuration(Duration(seconds: horas)),
    );
  }

  void salvar() async {
    {
      if (admperfil.senha == admperfil.confirmacaoSenha) {
        bool confirmacao = await admperfil.alterarUser(admperfil.id);
        if (confirmacao) {
          //await showAlertDialog1(context, confirmacao);
        }
      } else {
        focusNode.requestFocus();
      }
    }
  }
}
