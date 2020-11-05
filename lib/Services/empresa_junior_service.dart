import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Model/empresaJunior.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_GET_EJS = '${Globals.BASE_URL}/empresas-juniores/list.json';

class EmpresaJuniorService {

  
  Future<List<EmpresaJunior>> getEjs() async {

      http.Response response = await http.get(URL_GET_EJS, headers: Globals.noAuthToken);

      if (response.statusCode == 400) return new List<EmpresaJunior>();

      List parsedJson = json.decode(response.body);

      List<EmpresaJunior> ejs = new List<EmpresaJunior>();

      parsedJson.forEach((element) {
        ejs.add(new EmpresaJunior.fromJson(element));
       });

      return ejs;
  }
}