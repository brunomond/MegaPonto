import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/plantao_amigo_service.dart';
import 'package:megaponto_oficial/View/Utils/Loading.dart';
import 'package:megaponto_oficial/View/Utils/StdDialog.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:rxdart/rxdart.dart';
part 'plantao_amigo_controller.g.dart';

class PlantaoAmigoController = _PlantaoAmigoControllerBase
    with _$PlantaoAmigoController;

abstract class _PlantaoAmigoControllerBase with Store {
  final membrosEj = BehaviorSubject<List<Usuario>>.seeded(new List<Usuario>());
  ObservableStream<List<Usuario>> membrosEjOutput;

  @observable
  bool loadingNewState = false;

  _PlantaoAmigoControllerBase() {
    setMembrosEj();
    membrosEjOutput = membrosEj.stream.asObservable(initialValue: []);
  }

  @computed
  bool get loading => membrosEjOutput != null && membrosEjOutput.data == null;

  @action
  setMembrosEj() async {
    await PlantaoAmigoService().mostrarAmigos().then((list) {
      list.add(Globals.sessionController.loggedUser);
      list.sort((a, b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
      membrosEj.value = list;
    });
  }

  void dispose() {
    membrosEj.close();
  }

  @action
  Future<void> fetchData() async {
    await setMembrosEj()
        .then((_) => membrosEjOutput = membrosEj.stream.asObservable());
  }

  @action
  alterarPlantao(Usuario user, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => !loadingNewState
            ? StdDialog(
                contentText: user.online
                    ? 'Deseja finalizar o plantão do(a) ${user.nome}?'
                    : 'Deseja iniciar o plantão do(a) ${user.nome}?',
                options: {
                  'Cancelar': () => Navigator.of(context).pop(),
                  'Sim': () async => await _alterarPlantaoAmigo(user, context),
                },
              )
            : Loading());
  }

  @action
  _alterarPlantaoAmigo(Usuario user, BuildContext context) async {
    loadingNewState = true;
    Navigator.of(context).pop();

    var nomeUser = Globals.sessionController.loggedUser.nome;

    if (user.online) {
      await PlantaoAmigoService().fecharAmigo(user.id);

      OneSignal.shared.postNotification(OSCreateNotification(
          playerIds: [user.player_id],
          heading: "Plantão encerrado",
          //acrescentar duracao do plantao
          content: "Seu plantão foi encerrado pelo $nomeUser",
          androidLargeIcon: 'ic_onesignal_large_icon_default_sala_ponto'));
    } else {
      await PlantaoAmigoService().iniciarAmigo(user.id);

      OneSignal.shared.postNotification(OSCreateNotification(
          playerIds: [user.player_id],
          heading: "Plantão iniciado",
          //acrescentar hora de inicio
          content: "Seu plantão foi iniciado pelo $nomeUser",
          androidLargeIcon: 'ic_onesignal_large_icon_default_sala_ponto'));
    }
    fetchData().then((_) => loadingNewState = false);
  }

  @action
  _changeOnline(Usuario user) => user.online = !user.online;
}
