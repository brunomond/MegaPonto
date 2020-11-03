import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_CADASTRAR_USUARIO = '${Globals.BASE_URL}/usuarios/post.json';

class UserService {

    Future<bool> cadastro(Usuario user) async {

      http.Response response = 
      await http.post(URL_CADASTRAR_USUARIO, body: user.toMap(), headers: Globals.noAuthToken);

      return (response.statusCode == 200);
    }
}