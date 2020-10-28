import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Services/login_service.dart';

import 'package:mobx/mobx.dart';
part 'session_controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {
  _SessionControllerBase() {
    LoginService().enviarPlayerId();
  }

  @observable
  Usuario loggedUser;

  @observable
  bool pontoAtivo;

  @action
  setUser(Usuario user) => loggedUser = user;

  @action
  setPonto(bool ativo) => pontoAtivo = ativo;
}
