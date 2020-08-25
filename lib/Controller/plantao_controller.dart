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
  Future<void> iniciarPlantaoUser() async {}

  @action
  Future<void> iniciarPlantaoAmigo() async {}

  @action
  Future<void> fecharPlantao() async {
    Map parsedJson = await PontoService().fecharPlantao();
    duration = new Duration(seconds: parsedJson['tempo_online']);
    started = false;
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
