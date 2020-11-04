import 'package:megaponto_oficial/Controller/session_controller.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/perfil_service.dart';
import 'package:mobx/mobx.dart';
part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  _PerfilControllerBase() {
    carregarInfo();
  }
  @observable
  int tempoSemana = 0;

  @observable
  int tempoMes = 0;

  @observable
  int tempoAno = 0;

  @observable
  String nome = "";

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String apelido = "";

  @observable
  String telefone = "";

  @action
  void setNome(String value) => nome = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => nome = value;

  @action
  void setApelido(String value) => apelido = value;

  @action
  void setTelefone(String value) => telefone = value;

  @action
  carregarInfo() {
    nome = Globals.sessionController.loggedUser.nome;
    email = Globals.sessionController.loggedUser.email;
    apelido = Globals.sessionController.loggedUser.apelido;
    telefone = Globals.sessionController.loggedUser.telefone;
  }

  @action
  carregaTempo() async {
    await PerfilService().pegarInfoPlantao().then((json) {
      tempoSemana = json['total_semana'];
      tempoMes = json['total_mes'];
      tempoAno = json['total_ano'];
    });
  }

  @action
  editarPerfil() {}
  @action
  obterDadosUser() {}
}
