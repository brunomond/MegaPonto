import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_LIST_MEMBROS_ONLINE =
    'https://paineljunior.com.br/api/plantao/list.json?token=';

class MembrosController {
  Future<String> listarMembrosOnline() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_LIST_MEMBROS_ONLINE + prefs.getString('loginAuth');

    http.Response response = await http.get(urlToken);

    if (response.statusCode == 400) return "Erro";

    List parsedJson = json.decode(response.body);

    List<Usuario> listaUser = List();
    for (int i = 0; i <= parsedJson.length; i++) {
      Usuario user = Usuario.fromMap(parsedJson[i][9]['usuario']);
      listaUser.add(user);
    }

    return "ok";
  }
}
