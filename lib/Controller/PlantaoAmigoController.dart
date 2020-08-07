import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_GET_AMIGO =
    'https://paineljunior.com.br/api/membros/list.json?token=';

class PlantaoAmigoController {
  Future<List> mostrarAmigos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String urlToken = URL_GET_AMIGO + prefs.getString('loginAuth');

    http.Response response = await http.get(urlToken, headers: Globals.headers);

    if (response.statusCode == 400) return List();

    List amigos = json.decode(response.body);

    List<Usuario> listFuncionario = List();

    amigos.forEach((amigo) {
      Usuario user = Usuario.fromMap(amigo['usuario']);
      user.online = amigo['online'] != null;
      listFuncionario.add(user);
    });

    return listFuncionario;
  }
}
