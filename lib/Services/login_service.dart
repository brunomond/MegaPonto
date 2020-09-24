import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/View/Utils/ErrorSnackBar.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_LOGIN = 'https://paineljunior.com.br/api/login.json';

class LoginService {
  final String senha;
  final String email;

  LoginService({this.senha, this.email});

  Future<Usuario> doLogin(BuildContext context) async {
    Map<String, dynamic> body = {'email': email, 'senha': senha};

    http.Response response = await http.post(URL_LOGIN,
        body: jsonEncode(body), headers: Globals.headers);

    if (response.statusCode == 401) {
      Scaffold.of(context).showSnackBar(
          ErrorSnackBar(errorText: 'Usuário ou senha incorretos!'));
      return null;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('loginJson', response.body);

    return new Usuario.fromJson(json.decode(response.body)['user']);
  }

  Future<bool> enviarPlayerId(BuildContext context) async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();

    Map<String, dynamic> body = {'player_id': status.subscriptionStatus.userId};

    http.Response response = await http.post(URL_LOGIN,
        body: jsonEncode(body), headers: Globals.headers);

    if (response.statusCode == 401) return false;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('player_id', response.body);

    return true;
  }
}
