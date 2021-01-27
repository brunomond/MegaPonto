import 'package:megaponto_oficial/Model/noticia.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/feed_service.dart';
import 'package:megaponto_oficial/Services/plantao_amigo_service.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';
part 'feed_noticia_controller.g.dart';

class FeedNoticiaController = _FeedNoticiaControllerBase
    with _$FeedNoticiaController;

abstract class _FeedNoticiaControllerBase with Store {
  final noticias = BehaviorSubject<List<Noticia>>.seeded(new List<Noticia>());
  ObservableStream<List<Noticia>> noticiasEjOutput;

  _FeedNoticiaControllerBase() {
    obterNoticias();
    noticiasEjOutput = noticias.stream.asObservable(initialValue: []);
  }

  @observable
  String conteudo = "";

  @observable
  String titulo = "";

  @observable
  String nomeCriador = "";

  @action
  void setNoticia(String value) => conteudo = value;

  @action
  void setTitulo(String value) => titulo = value;

  @action
  void setCriador(String value) => nomeCriador = value;

  @action
  Future<void> fetchData() async {
    await obterNoticias()
        .then((_) => noticiasEjOutput = noticias.stream.asObservable());
  }

  @action
  obterNoticias() async {
    List<Usuario> membros = List();

    List listaNoticia = await FeedService().obterNoticias();

    await PlantaoAmigoService().mostrarAmigos().then((list) {
      list.add(Globals.sessionController.loggedUser);
      membros = list;
    });

    listaNoticia.forEach((element) {
      Noticia noticia = Noticia.fromMap(element);
      DateTime timeCreated = DateTime.parse(noticia.created).toLocal();
      noticia.created = DateFormat.MMMMd('pt_Br').format(timeCreated) +
          ' às ' +
          DateFormat.Hm().format(timeCreated);

      if (noticia.usuarioId == Globals.sessionController.loggedUser.id) {
        noticia.nomeUsuario = Globals.sessionController.loggedUser.nome;
      } else {
        membros.forEach((elementUser) {
          if (noticia.usuarioId == elementUser.usuarioId) {
            noticia.nomeUsuario = elementUser.nome;
          }
        });
      }

      noticias.value.add(noticia);
    });
  }

  void dispose() {
    noticias.close();
  }
}
