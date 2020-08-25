import 'package:megaponto_oficial/Services/ponto_service.dart';
import 'package:mobx/mobx.dart';

part 'plantao_controller.g.dart';

class PlantaoController = _PlantaoControllerBase with _$PlantaoController;

abstract class _PlantaoControllerBase with Store {
  _PlantaoControllerBase() {
    obterStatusPlantao();
  }

  @observable
  bool started = false;

  @observable
  Duration duration;

  @observable
  bool loading = true;

  @action
  void setStarted(bool iniciado) => started = iniciado;

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
      if (map)
        started = true;
      else
        started = false;
    });
  }

  @action
  Future<void> fecharPlantao() async {
    await PontoService().fecharPlantao().then((map) {
      duration = new Duration(seconds: map['tempo_online']);
      started = false;
    });
  }

  @action
  Future<void> obterStatusPlantao() async {
    await PontoService().obterStatusPlantao().then((map) {
      if (map == true)
        started = true;
      else
        started = false;
      loading = false;
    });
  }
}
