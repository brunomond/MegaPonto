import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_GET_AMIGO =
    'https://paineljunior.com.br/api/membros/list.json?token=';
const String URL_POST_INICIA_AMIGO =
    'https://paineljunior.com.br/api/membros/post.json?token=';
const String URL_PUT_FECHA_AMIGO =
    'https://paineljunior.com.br/api/membros/put.json?token=';

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

  Future<String> iniciarAmigo(int cod) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> body = {'amigo': cod};

    String urlToken = URL_POST_INICIA_AMIGO + prefs.getString('loginAuth');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    http.Response response =
        await http.post(urlToken, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 400) return "Erro";

    Map parsedJson = json.decode(response.body);
    return parsedJson["comeco"];
  }

  Future<Map> fecharAmigo(int cod) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> body = {'amigo': cod};

    String urlToken = URL_PUT_FECHA_AMIGO + prefs.getString('loginAuth');
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };

    http.Response response =
        await http.put(urlToken, body: jsonEncode(body), headers: headers);

    if (response.statusCode == 400) return Map();

    return json.decode(response.body);
  }
}
