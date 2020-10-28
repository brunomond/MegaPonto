import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_INFO_PLANTAO =
    'https://paineljunior.com.br/api/plantao/get.json';

class PerfilService {
  Future<Map> pegarInfoPlantao() async {
    final String token = Globals.sessionController.loggedUser.token;
    final Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    http.Response response = await http.get(URL_INFO_PLANTAO, headers: headers);

    if (response.statusCode != 200)
      return {'total_semana': 0, 'total_mes': 0, 'total_ano': 0};

    Map parsedJson = json.decode(response.body);

    return parsedJson;
  }
}
