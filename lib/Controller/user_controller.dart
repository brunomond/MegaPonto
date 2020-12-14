import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/login_controller.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Services/user_service.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {

  _UserControllerBase() {
    user = Usuario();
  }
  @observable
  Usuario user;

 @observable
  String password;

  @observable
  bool loading = false;

  @action
  setUser(Usuario value) => user = value;

 @action
  setPassword(String value) => password = value;

  @action
  cadastrar(BuildContext context) async {
    loading = true;

    UserService service = new UserService();
    await service.cadastro(user, password).then((isOk) {
      if(isOk) {
        LoginController login = LoginController();
        login.setEmail(user.email);
        login.setPassword(password);
        login.login(context);
      }
    });
  }
}