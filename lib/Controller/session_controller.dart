import 'package:megaponto_oficial/Controller/plantao_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Services/ponto_service.dart';

import 'package:mobx/mobx.dart';
part 'session_controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {
  @observable
  Usuario loggedUser;

  @observable
  bool pontoAtivo;

  @action
  setUser(Usuario user) => loggedUser = user;

  @action
  setPonto(bool ativo) => pontoAtivo = ativo;

  @action
  Future<void> obterStatusPlantao() async {
    await PontoService().obterStatusPlantao().then((map) {
      if (map)
        SessionController().setPonto(true);
      else
        SessionController().setPonto(false);
      PlantaoController().setLoading(false);
    });
  }
}
