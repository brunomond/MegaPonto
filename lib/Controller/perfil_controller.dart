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
  String senha = "";

  @observable
  String confirmacaoSenha = "";

  @observable
  String apelido = "";

  @observable
  String celular = "";

  @observable
  int id = 0;

  @action
  void setNome(String value) => nome = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  void setConfirmacaoSenha(String value) => confirmacaoSenha = value;

  @action
  void setApelido(String value) => apelido = value;

  @action
  void setCelular(String value) => celular = value;

  @action
  carregarInfo() {
    nome = Globals.sessionController.loggedUser.nome;
    email = Globals.sessionController.loggedUser.email;
    apelido = Globals.sessionController.loggedUser.apelido;
    celular = Globals.sessionController.loggedUser.celular;
    id = Globals.sessionController.loggedUser.id;
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
  alterarUser(int id) async {
    await PerfilService()
        .alterarDadosUser(nome, email, senha, apelido, celular, id)
        .then((confirmacao) {
      if (confirmacao) print("ok");
    });
  }

  @action
  editarPerfil() {}
  @action
  obterDadosUser() {}
}
