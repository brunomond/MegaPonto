import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Constantes
const String URL_LOGIN = 'https://paineljunior.com.br/api/login';

class LoginController {

  String senha;
  LoginController({this.senha});
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();


  Future<bool> doLogin(Usuario usuario) async {

    if(!formKey.currentState.validate()) return false;

  formKey.currentState.save();

   Map<String, dynamic> body = {
     'email' : usuario.email,
     'senha' : senha
   };

    http.Response response = await http.post(URL_LOGIN, body: json.encode(body));

    Map parsedJson = json.decode(response.body);

    if(parsedJson['error'] != null) return false;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(parsedJson['token'], response.body);
    prefs.setString('loginAuth', parsedJson['token']);

    return prefs.get('loginAuth') != null;

 }

}