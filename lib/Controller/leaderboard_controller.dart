import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Services/plantao_amigo_service.dart';
import 'package:mobx/mobx.dart';
part 'leaderboard_controller.g.dart';

class LeaderBoardController = _LeaderBoardControllerBase
    with _$LeaderBoardController;

abstract class _LeaderBoardControllerBase with Store {
  Future<List<Usuario>> rankingSemanal() async {
    List<Usuario> listaSemanal;
    await PlantaoAmigoService().mostrarAmigos().then((list) {
      listaSemanal = list;
    });
    listaSemanal.sort((a, b) => a.total_semana.compareTo(b.total_semana));
    return listaSemanal;
  }

  Future<List<Usuario>> rankingMensal(List<Usuario> list) async {
    list.sort((a, b) => a.total_mes.compareTo(b.total_mes));
    return list;
  }

  Future<List<Usuario>> rankingAnual(List<Usuario> list) async {
    list.sort((a, b) => a.total_ano.compareTo(b.total_ano));
    return list;
  }
}
