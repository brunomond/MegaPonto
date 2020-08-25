import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_INICIAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/post.json?token=';

const String URL_FECHAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/put.json?token=';

const String URL_INFO_PLANTAO =
    'https://paineljunior.com.br/api/plantao/get.json?token=';

class PontoService {
  Future<DateTime> iniciarPlantao() async {
    http.Response response =
        await http.post(obterUrlComToken(URL_INICIAR_PLANTAO));

    //if (response.statusCode == 400) return DateTime.parse("00:00");

    Map parsedJson = json.decode(response.body);

    return DateTime.parse(parsedJson['comeco']).toLocal();
  }

  Future<Map> fecharPlantao() async {
    http.Response response =
        await http.put(obterUrlComToken(URL_FECHAR_PLANTAO));

    if (response.statusCode == 400) return Map();

    return json.decode(response.body);
  }

  Future<bool> obterStatusPlantao() async {
    http.Response response = await http.get(obterUrlComToken(URL_INFO_PLANTAO));

    if (response.statusCode != 200) return false;

    return true;
  }

  String obterUrlComToken(String url) {
    String urlToken = url + Globals.sessionController.loggedUser.token;
    return urlToken;
  }
}
