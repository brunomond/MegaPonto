import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/login_service.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool visible = false;

  @observable
  bool loading = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void toggleVisibility() => visible = !visible;

  @action
  login(BuildContext context) async {
    loading = true;

    LoginService service = new LoginService(email: email, senha: password);
    await service.doLogin(context).then((user) {
      if (user != null) {
        Globals.sessionController.setUser(user);
        Navigator.of(context).popAndPushNamed('/home');
      }

      email = "";
      password = "";
      loading = false;
    });
  }

  @computed
  bool get isValidEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isValidPass => password.length > 0;

  @computed
  bool get loginPressed => (isValidPass && isValidEmail && !loading);

  @computed
  IconData get iconVisibility =>
      visible ? Icons.visibility : Icons.visibility_off;
}
