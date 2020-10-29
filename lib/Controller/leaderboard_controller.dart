import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Services/plantao_amigo_service.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
part 'leaderboard_controller.g.dart';

class LeaderBoardController = _LeaderBoardControllerBase
    with _$LeaderBoardController;

abstract class _LeaderBoardControllerBase with Store {
  final membrosEj = BehaviorSubject<List<Usuario>>.seeded(new List<Usuario>());
  ObservableStream<List<Usuario>> membrosEjOutput;

  @observable
  bool loadingNewState = false;

  @computed
  bool get loading => membrosEjOutput != null && membrosEjOutput.data == null;

  _LeaderBoardControllerBase() {
    setMembrosEj();
    membrosEjOutput = membrosEj.stream.asObservable(initialValue: []);
  }

  @action
  setMembrosEj() async {
    await PlantaoAmigoService().mostrarAmigos().then((list) {
      list.sort((a, b) => b.total_semana.compareTo(a.total_semana));
      membrosEj.value = list;
    });
  }

  void dispose() {
    membrosEj.close();
  }

  @action
  Future<void> fetchData() async {
    await setMembrosEj()
        .then((_) => membrosEjOutput = membrosEj.stream.asObservable());
  }

  @action
  alterarList(int index) async {
    switch (index) {
      case 0:
        membrosEjOutput.value
            .sort((a, b) => b.total_semana.compareTo(a.total_semana));
        break;
      case 1:
        membrosEjOutput.value
            .sort((a, b) => b.total_mes.compareTo(a.total_mes));
        break;
      case 2:
        membrosEjOutput.value
            .sort((a, b) => b.total_ano.compareTo(a.total_ano));
        break;
    }
  }
}
