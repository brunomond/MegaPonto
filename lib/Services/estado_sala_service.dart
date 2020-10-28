import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_PUT_SALA_CAFE =
    'https://paineljunior.com.br/api/home/put.json';

const String URL_GET_SALA_CAFE =
    'https://paineljunior.com.br/api/home/get.json';

const String URL_PLAYERID = 'https://paineljunior.com.br/api/usuarios/put/';

class EstadoSalaService {
  Future<EstadoSalaEnum> alterarEstadoSala(
      EstadoSalaEnum estadoSalaEnum) async {
    Map<String, dynamic> body = {'status': estadoSalaEnum.value};

    http.Response response = await http.put(URL_PUT_SALA_CAFE,
        body: jsonEncode(body), headers: Globals.headers);

    if (response.statusCode == 400) return EstadoSalaEnum.ERRO;

    Map parsedJson = json.decode(response.body);

    return EstadoSalaEnumExtension.responseData(parsedJson['status']);
  }

  Future<String> alterarHorarioCafe() async {
    Map<String, dynamic> body = {'cafe': true};

    http.Response response = await http.put(URL_PUT_SALA_CAFE,
        body: jsonEncode(body), headers: Globals.headers);

    if (response.statusCode == 400) return "Erro";

    Map parsedJson = json.decode(response.body);

    return parsedJson["cafe"];
  }

  Future<Map> getSalaCafe() async {
    http.Response response =
        await http.get(URL_GET_SALA_CAFE, headers: Globals.headers);

    if (response.statusCode == 400) return Map();

    Map parsedJson = json.decode(response.body);

    return parsedJson;
  }
}
