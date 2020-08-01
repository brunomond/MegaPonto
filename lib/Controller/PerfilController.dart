import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String URL_INFO_PLANTAO =
    "https://paineljunior.com.br/api/plantao/get.json?token=";

class PerfilController {
  Future<int> pegarInfoPlantaoSemana() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String urlToken = URL_INFO_PLANTAO + preferences.getString('loginAuth');

    http.Response response = await http.get(urlToken);

    if (response.statusCode == 400) return 0;

    Map parsedJson = json.decode(response.body);

    return parsedJson['total_semana'];
  }

  // Future<int> pegarInfoPlantaoMensal() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();

  //   String urlToken = URL_INFO_PLANTAO + preferences.getString('loginAuth');

  //   http.Response response = await http.get(urlToken);

  //   if (response.statusCode == 400) return 0;

  //   Map parsecJson = json.decode(response.body);

  //   return parsecJson['total_mes'];
  // }
}
