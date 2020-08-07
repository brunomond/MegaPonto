import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String URL_GET_AMIGO = 'https://paineljunior.com.br/api/home/put.json?token=';

class PlantaoAmigoController {
  Future <Map> mostrarAmigos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

  String urlToken = URL_GET_AMIGO + prefs.getString('loginAuth');

  http.Response response = await http.put(urlToken);

  //if (response.statusCode == 400) return Map();

  return json.decode(response.body);
  }
}
