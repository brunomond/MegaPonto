import 'dart:convert';

import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:http/http.dart' as http;

const String URL_LIST_MEMBROS_ONLINE =
    'https://paineljunior.com.br/api/plantao/list.json';

class MembrosOnlineService {
  Future<List<Usuario>> listarMembrosOnline() async {
    http.Response response =
        await http.get(URL_LIST_MEMBROS_ONLINE, headers: Globals.headers);

    if (response.statusCode == 400) return new List<Usuario>();

    List parsedJson = json.decode(response.body);

    List<Usuario> listaUser = new List<Usuario>();

    if (Globals.sessionController.pontoAtivo ?? false)
      listaUser.add(Globals.sessionController.loggedUser);

    parsedJson.forEach((response) {
      listaUser.add(new Usuario.fromJson(response['usuario']));
    });

    return listaUser;
  }
}
