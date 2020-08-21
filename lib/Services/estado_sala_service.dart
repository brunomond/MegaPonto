import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_PUT_SALA_CAFE =
    'https://paineljunior.com.br/api/home/put.json?token=';

const String URL_GET_SALA_CAFE =
    'https://paineljunior.com.br/api/home/get.json?token=';

class EstadoSalaService {
  Future<EstadoSalaEnum> alterarEstadoSala(
      EstadoSalaEnum estadoSalaEnum) async {
    String tokenUser = Globals.sessionController.loggedUser.token;

    String urlToken = '$URL_PUT_SALA_CAFE$tokenUser';

    Map<String, dynamic> body = {'status': estadoSalaEnum.value};

    http.Response response = await http.put(urlToken,
        body: jsonEncode(body), headers: Globals.headers);

    if (response.statusCode == 400) return EstadoSalaEnum.ERRO;

    Map parsedJson = json.decode(response.body);

    return EstadoSalaEnumExtension.responseData(parsedJson['status']);
  }

  Future<String> alterarHorarioCafe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> body = {'cafe': true};

    String urlToken = URL_PUT_SALA_CAFE + prefs.getString('loginAuth');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    http.Response response =
        await http.put(urlToken, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 400) return "Erro";

    Map parsedJson = json.decode(response.body);

    return parsedJson["cafe"];
  }

  Future<Map> getSalaCafe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_GET_SALA_CAFE + prefs.getString('loginAuth');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    http.Response response = await http.get(urlToken, headers: headers);

    if (response.statusCode == 400) return Map();

    Map parsedJson = json.decode(response.body);

    return parsedJson;
  }
}
