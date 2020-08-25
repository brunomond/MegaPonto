import 'package:megaponto_oficial/Controller/session_controller.dart';
import 'package:megaponto_oficial/Services/ponto_service.dart';
import 'package:mobx/mobx.dart';

part 'plantao_controller.g.dart';

class PlantaoController = _PlantaoControllerBase with _$PlantaoController;

abstract class _PlantaoControllerBase with Store {
  @observable
  Duration duration;

  @observable
  bool loading = true;

  @action
  void setLoading(bool carregando) => loading = carregando;

  @action
  void setDuration(Duration duracao) => duration = duracao;

  @action
  Future<void> iniciarPlantaoAmigo() async {}

  @action
  Future<void> fecharPlantaoAmigo() async {}

  @action
  Future<void> iniciarPlantaoUser() async {
    await PontoService().iniciarPlantao().then((map) {
      SessionController().setPonto(map);
    });
  }

  @action
  Future<void> fecharPlantao() async {
    await PontoService().fecharPlantao().then((map) {
      SessionController().setPonto(map['tempo_online'] == null);
      duration = new Duration(seconds: map['tempo_online']);
    });
  }
}
