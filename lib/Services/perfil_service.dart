import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_INFO_PLANTAO =
    'https://paineljunior.com.br/api/plantao/get.json?token=';

class PerfilService {

  String tokenUser = Globals.sessionController.loggedUser.token;
  
  Future<Map> pegarInfoPlantao() async {

    String urlToken = '$URL_INFO_PLANTAO$tokenUser';

    http.Response response = await http.get(urlToken, headers: Globals.headers);

    if (response.statusCode != 200) return {'total_semana' : 0, 'total_mes' : 0, 'total_ano' : 0};

    Map parsedJson = json.decode(response.body);

    return parsedJson;
  }
}