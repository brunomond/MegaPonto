import 'package:megaponto_oficial/Controller/session_controller.dart';
import 'package:megaponto_oficial/Services/ponto_service.dart';
import 'package:mobx/mobx.dart';

part 'ponto_controller.g.dart';

class PontoController = _PontoControllerBase with _$PontoController;

abstract class _PontoControllerBase with Store {
  _PontoControllerBase() {
    obterStatusPlantao();
  }

  @observable
  Duration duration;

  @observable
  bool pontoAtivo;

  @observable
  bool loading = true;

  @action
  void setLoading(bool carregando) => loading = carregando;

  @action
  void setDuration(Duration duracao) => duration = duracao;

  @action
  void setPontoAtivo(bool status) => pontoAtivo = status;

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

  @action
  Future<void> obterStatusPlantao() async {
    await PontoService().obterStatusPlantao().then((map) {
      if (map)
        pontoAtivo = true;
      //SessionController().setPonto(true);
      else
        pontoAtivo = false;
      //SessionController().setPonto(false);
      loading = false;
    });
  }
}
