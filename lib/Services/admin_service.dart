import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';

const String URL_DELETE_MEMBRO = '${Globals.BASE_URL}/usuarios/delete/';

class AdminService{
  Future<bool> deletarMembro(int id) async {
    String url = URL_DELETE_MEMBRO + id.toString() + '.json' ;
    http.Response response = await http.delete(url, headers: Globals.tokenHeader);
    if(response.statusCode == 200) return true;
    return false;
  }
}