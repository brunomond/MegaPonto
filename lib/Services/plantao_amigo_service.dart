import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_GET_AMIGO =
    'https://paineljunior.com.br/api/membros/list.json?token=';
const String URL_POST_INICIA_AMIGO =
    'https://paineljunior.com.br/api/membros/post.json?token=';
const String URL_PUT_FECHA_AMIGO =
    'https://paineljunior.com.br/api/membros/put.json?token=';

class PlantaoAmigoService {

  String tokenUser = Globals.sessionController.loggedUser.token;

  Future<List> mostrarAmigos() async {
    String urlToken = '$URL_GET_AMIGO$tokenUser';

    http.Response response = await http.get(urlToken, headers: Globals.headers);

    if (response.statusCode == 400) return new List<Usuario>();

    List parsedJson = json.decode(response.body);

    List<Usuario> listFuncionario = List();

    parsedJson.forEach((amigo) {
      Usuario user = Usuario.fromMap(amigo['usuario']);
      user.online = amigo['online'] != null;
      listFuncionario.add(user);
    });

    return listFuncionario;
  }

  Future<void> iniciarAmigo(int id) async {
    Map<String, dynamic> body = {'amigo': id};

    String urlToken = '$URL_POST_INICIA_AMIGO$tokenUser';

    await http.post(urlToken,
        body: jsonEncode(body), headers: Globals.headers);

  
  }

  Future<void> fecharAmigo(int id) async {
    Map<String, dynamic> body = {'amigo': id};

    String urlToken = '$URL_PUT_FECHA_AMIGO$tokenUser';

    await http.put(urlToken,
        body: jsonEncode(body), headers: Globals.headers);
  }
}
