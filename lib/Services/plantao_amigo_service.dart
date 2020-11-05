import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_GET_AMIGO =
    'https://paineljunior.com.br/api/membros/list.json';
const String URL_POST_INICIA_AMIGO =
    'https://paineljunior.com.br/api/membros/post.json';
const String URL_PUT_FECHA_AMIGO =
    'https://paineljunior.com.br/api/membros/put.json';

class PlantaoAmigoService {
  String tokenUser = Globals.sessionController.loggedUser.token;

  Future<List> mostrarAmigos() async {
    http.Response response =
        await http.get(URL_GET_AMIGO, headers: Globals.tokenHeader);

    if (response.statusCode == 400) return new List<Usuario>();

    List parsedJson = json.decode(response.body);

    List<Usuario> listFuncionario = List();

    parsedJson.forEach((amigo) {
      Usuario user = Usuario.fromMap(
          amigo['usuario'],
          (amigo['total_mes'] == null) ? 0 : amigo['total_mes'],
          (amigo['total_ano'] == null) ? 0 : amigo['total_ano'],
          (amigo['total_semana'] == null) ? 0 : amigo['total_semana']);
      user.online = amigo['online'] != null;
      listFuncionario.add(user);
    });

    return listFuncionario;
  }

  Future<void> iniciarAmigo(int id) async {
    Map<String, dynamic> body = {'amigo': id};

    await http.post(URL_POST_INICIA_AMIGO,
        body: jsonEncode(body), headers: Globals.tokenHeader);
  }

  Future<void> fecharAmigo(int id) async {
    Map<String, dynamic> body = {'amigo': id};

    await http.put(URL_PUT_FECHA_AMIGO,
        body: jsonEncode(body), headers: Globals.tokenHeader);
  }
}
