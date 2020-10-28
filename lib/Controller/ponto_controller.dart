import 'package:megaponto_oficial/Controller/session_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/ponto_service.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

part 'ponto_controller.g.dart';

class PontoController = _PontoControllerBase with _$PontoController;

abstract class _PontoControllerBase with Store {
  _PontoControllerBase() {
    obterStatusPlantao();
  }

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
      Globals.sessionController.pontoAtivo = map;
    });

    OneSignal.shared.postNotification(OSCreateNotification(
      playerIds: [Globals.sessionController.loggedUser.player_id],
      heading: "Plantão Iniciado",
      content: "Não se esqueça de fechar o plantão após sair",
      androidLargeIcon: 'ic_onesignal_large_icon_default_sala_ponto',
    ));
  }

  @action
  Future<void> fecharPlantao() async {
    await PontoService().fecharPlantao().then((map) {
      SessionController().setPonto(map['tempo_online'] == null);
      Globals.sessionController.pontoAtivo = false;
      duration = new Duration(seconds: map['tempo_online']);
    });
  }

  @action
  Future<void> obterStatusPlantao() async {
    await PontoService().obterStatusPlantao().then((map) {
      if (map) {
        SessionController().setPonto(true);
        Globals.sessionController.pontoAtivo = true;
      } else {
        SessionController().setPonto(false);
        Globals.sessionController.pontoAtivo = false;
      }

      loading = false;
    });
  }
}
