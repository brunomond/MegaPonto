import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/Model/noticia.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/plantao_amigo_service.dart';

const String URL_ENVIAR_NOTICIA = 'https://paineljunior.com.br/api/feed/post.json';
const String URL_OBTER_NOTICIA = 'https://paineljunior.com.br/api/feed/get.json';

class FeedService{

  Future<bool> enviarNoticia(String titulo, String conteudo) async {
    Map<String, dynamic> body = {'titulo': titulo, 'conteudo': conteudo,  'usuario_id': Globals.sessionController.loggedUser.id,
     'empresas_juniore_id': 1,};

    http.Response response = await http.post(URL_ENVIAR_NOTICIA, body: jsonEncode(body), headers: Globals.tokenHeader);

    Map parsedJson = json.decode(response.body);

    if(parsedJson['message'] == 'Success'){
      return true;
    }
    return false;
  }

  Future<List<Noticia>> obterNoticias() async {

    List<Noticia> noticias = List();
    List<Usuario> membros = List();

    http.Response response = await http.get(URL_OBTER_NOTICIA, headers: Globals.tokenHeader);

    await PlantaoAmigoService().mostrarAmigos().then((list) {
      list.add(Globals.sessionController.loggedUser);
      membros = list;
    });

    List parsedJson = json.decode(response.body);
    parsedJson.forEach((element) {
      Noticia noticia = Noticia.fromMap(element);
      DateTime timeCreated = DateTime.parse(noticia.created).toLocal();
      noticia.created = DateFormat.MMMMd('pt_Br').format(timeCreated)  +
          ' às ' +
          DateFormat.Hm().format(timeCreated);

      membros.forEach((elementUser) {
        if(noticia.usuarioId == elementUser.usuarioId){
          noticia.nomeUsuario = elementUser.nome;
        }
      });
      noticias.add( noticia );
      });
      if(noticias.isEmpty) return List();

 

    return noticias;
  }
}