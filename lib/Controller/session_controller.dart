import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:mobx/mobx.dart';
part 'session_controller.g.dart';

class SessionController = _SessionControllerBase with _$SessionController;

abstract class _SessionControllerBase with Store {
  
  Usuario loggedUser;

  @action
  setUser(Usuario user) => loggedUser = user;
  
}