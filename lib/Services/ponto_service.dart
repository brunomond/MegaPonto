import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_INICIAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/post.json';

const String URL_FECHAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/put.json';

const String URL_INFO_PLANTAO =
    'https://paineljunior.com.br/api/plantao/get.json';

class PontoService {
  Future<bool> iniciarPlantao() async {
    final String token = Globals.sessionController.loggedUser.token;
    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    http.Response response =
        await http.post(URL_INICIAR_PLANTAO, headers: headers);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 400) return false;

    prefs.setBool('pontoAtivo', true);
    return true;
  }

  Future<Map> fecharPlantao() async {
    final String token = Globals.sessionController.loggedUser.token;
    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    http.Response response =
        await http.put(URL_FECHAR_PLANTAO, headers: headers);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 400) return Map();

    prefs.setBool('pontoAtivo', false);
    return json.decode(response.body);
  }

  Future<bool> obterStatusPlantao() async {
    final String token = Globals.sessionController.loggedUser.token;
    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    http.Response response = await http.get(URL_INFO_PLANTAO, headers: headers);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('pontoAtivo', response.statusCode == 200);

    return prefs.get('pontoAtivo');
  }

  String obterUrlComToken(String url) {
    String urlToken = url + Globals.sessionController.loggedUser.token;
    return urlToken;
  }
}
