import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Controller/PontoController.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String URL_LIST_MEMBROS_ONLINE =
    'https://paineljunior.com.br/api/plantao/list.json?token=';

class MembrosController {
  Future<List> listarMembrosOnline() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PontoController pontoController = PontoController();

    String urlToken = URL_LIST_MEMBROS_ONLINE + prefs.getString('loginAuth');

    http.Response response = await http.get(urlToken);

    if (response.statusCode == 400) return List();

    List parsedJson = json.decode(response.body);

    List<Usuario> listaUser = List();

    String usuario = prefs.getString(prefs.getString('loginAuth'));
    Map usuarioMap = jsonDecode(usuario);
    Usuario user = Usuario.fromMap(usuarioMap['user']);
    if (await pontoController.verificarUserOnline() == 1) listaUser.add(user);

    for (int i = 0; i < parsedJson.length; i++) {
      Usuario user = Usuario.fromMap(parsedJson[i]['usuario']);
      listaUser.add(user);
    }

    return listaUser;
  }
}
