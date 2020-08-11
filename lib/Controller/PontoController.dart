import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String URL_INICIAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/post.json?token=';

const String URL_FECHAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/put.json?token=';

const String URL_INFO_PLANTAO =
    'https://paineljunior.com.br/api/plantao/get.json?token=';

class PontoController {
  Future<DateTime> iniciarPlantao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_INICIAR_PLANTAO + prefs.getString('loginAuth');

    http.Response response = await http.post(urlToken);

    //if (response.statusCode == 400) return DateTime.parse("00:00");

    Map parsedJson = json.decode(response.body);

    return DateTime.parse(parsedJson['comeco']).toLocal();
  }

  Future<Map> fecharPlantao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_FECHAR_PLANTAO + prefs.getString('loginAuth');

    http.Response response = await http.put(urlToken);

    if (response.statusCode == 400) return Map();

    return json.decode(response.body);
  }

  Future<int> verificarUserOnline() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String urlToken = URL_INFO_PLANTAO + preferences.getString('loginAuth');

    http.Response response = await http.get(urlToken);

    if (response.statusCode != 200) return 0;

    return 1;
  }
}
