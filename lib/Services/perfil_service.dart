import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_INFO_PLANTAO =
    'https://paineljunior.com.br/api/plantao/get.json';

const String URL_PUT_USUARIO = 'https://paineljunior.com.br/api/usuarios/put/';

class PerfilService {
  Future<Map> pegarInfoPlantao() async {
    http.Response response =
        await http.get(URL_INFO_PLANTAO, headers: Globals.tokenHeader);

    if (response.statusCode != 200)
      return {'total_semana': 0, 'total_mes': 0, 'total_ano': 0};

    Map parsedJson = json.decode(response.body);

    return parsedJson;
  }

  Future<bool> alterarDadosUser(String nome, String sobrenome, String email,
      String senha, String apelido, String celular, int id) async {
    Map<String, dynamic> body;
    if (senha != "") {
      if (sobrenome != "") {
        body = {
          'nome': nome,
          'email': email,
          'sobrenome': sobrenome,
          'apelido': apelido,
          'celular': celular,
          'senha': senha
        };
      } else {
        body = {
          'nome': nome,
          'email': email,
          'apelido': apelido,
          'celular': celular,
          'senha': senha
        };
      }
    } else {
      if (sobrenome != "") {
        body = {
          'nome': nome,
          'email': email,
          'sobrenome': sobrenome,
          'apelido': apelido,
          'celular': celular,
        };
      } else {
        body = {
          'nome': nome,
          'email': email,
          'apelido': apelido,
          'celular': celular,
        };
      }
    }

    http.Response response = await http.put(
        URL_PUT_USUARIO + id.toString() + '.json',
        headers: Globals.tokenHeader,
        body: jsonEncode(body));

    Map parsedJson = json.decode(response.body);

    if (parsedJson["message"] == "Erro ao atualizar usuario" ||
        response.statusCode != 200)
      return false;
    else {
      Globals.sessionController.loggedUser.apelido = apelido;
      Globals.sessionController.loggedUser.nome = nome;
      Globals.sessionController.loggedUser.email = email;
      Globals.sessionController.loggedUser.celular = celular;
    }

    return true;
  }
}
