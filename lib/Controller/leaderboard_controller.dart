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

  @action
  Future<void> fetchData() async {
    await setMembrosEj()
        .then((_) => membrosEjOutput = membrosEj.stream.asObservable());
  }

  @action
  setMembrosEj() async {
    await PlantaoAmigoService().mostrarAmigos().then((list) {
      membrosEj.value = list;
    });
  }

  void dispose() {
    membrosEj.close();
  }
}
