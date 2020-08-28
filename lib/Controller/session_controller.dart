import 'package:megaponto_oficial/Model/usuario.dart';

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
}
