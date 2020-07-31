import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/EstadoSalaEnum.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_LOGIN = 'https://paineljunior.com.br/api/home/put.json?token=';

class EstadoSalaController {
  Future<EstadoSalaEnum> alterarEstadoSala(
      EstadoSalaEnum estadoSalaEnum) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> body = {'status': estadoSalaEnum.value.toString()};

    String urlToken = URL_LOGIN + prefs.getString('loginAuth');

    http.Response response = await http.put(urlToken, body: body);

    if (response.statusCode == 400) return EstadoSalaEnum.ERRO;

    Map parsedJson = json.decode(response.body);

    return EstadoSalaEnumExtension.responseData(parsedJson['status']);
  }
}
