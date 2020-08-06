import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String URL_INICIAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/post.json?token=';

const String URL_FECHAR_PLANTAO =
    'https://paineljunior.com.br/api/plantao/put.json?token=';

class PontoController {
  Future<DateTime> iniciarPlantao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_INICIAR_PLANTAO + prefs.getString('loginAuth');

    http.Response response = await http.post(urlToken);

    //if (response.statusCode == 400) return "Plantão já foi iniciado";

    Map parsedJson = json.decode(response.body);

    DateTime horaInicio = DateTime.parse(parsedJson['comeco']).toLocal();

<<<<<<< HEAD
    return horaInicio;
=======
    return "ok";
>>>>>>> origin/bruno
  }

  Future<int> fecharPlantao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_FECHAR_PLANTAO + prefs.getString('loginAuth');

    http.Response response = await http.put(urlToken);

    if (response.statusCode == 400) return 0;

    Map parsedJson = json.decode(response.body);

    return parsedJson['tempo_online'];
  }
}
