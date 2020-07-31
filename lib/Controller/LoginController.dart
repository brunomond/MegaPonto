import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/View/Utils/ErrorSnackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Constantes
const String URL_LOGIN = 'https://paineljunior.com.br/api/login.json';

class LoginController {
  String senha;
  BuildContext context;
  LoginController({this.senha, this.context});
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Future<bool> doLogin(Usuario usuario, BuildContext context) async {
    if (!formKey.currentState.validate()) return false;

    formKey.currentState.save();

    Map<String, dynamic> body = {'email': usuario.email, 'senha': senha};

    http.Response response = await http.post(URL_LOGIN, body: body);

    Map parsedJson = json.decode(response.body);

    if (response.statusCode == 401) {
     Scaffold.of(context).showSnackBar(ErrorSnackBar(errorText: 'Usuário ou senha incorretos!'));
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(parsedJson['user']['token'], response.body);
    prefs.setString('loginAuth', parsedJson['user']['token']);

    return prefs.get('loginAuth') != null;
  }
}
