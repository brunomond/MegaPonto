import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

const String URL_ENVIAR_NOTICIA =
    'https://paineljunior.com.br/api/feed/post.json';
const String URL_OBTER_NOTICIA =
    'https://paineljunior.com.br/api/feed/get.json';

class FeedService {
  Future<bool> enviarNoticia(String titulo, String conteudo) async {
    Map<String, dynamic> body = {
      'titulo': titulo,
      'conteudo': conteudo,
      'usuario_id': Globals.sessionController.loggedUser.id,
      'empresas_juniore_id': 1,
    };

    http.Response response = await http.post(URL_ENVIAR_NOTICIA,
        body: jsonEncode(body), headers: Globals.tokenHeader);

    Map parsedJson = json.decode(response.body);

    if (parsedJson['message'] == 'Success') {
      OneSignal.shared.postNotification(OSCreateNotification(
          playerIds: [Globals.sessionController.loggedUser.player_id],
          androidLargeIcon: 'ic_onesignal_large_icon_default_cofe',
          heading: 'Nova notícia',
          content: '$titulo'));
      return true;
    }
    return false;
  }

  Future<List> obterNoticias() async {
    http.Response response =
        await http.get(URL_OBTER_NOTICIA, headers: Globals.tokenHeader);

    List parsedJson = json.decode(response.body);

    return parsedJson;
  }
}
