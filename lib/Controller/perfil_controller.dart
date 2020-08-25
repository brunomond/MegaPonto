import 'package:megaponto_oficial/Services/perfil_service.dart';
import 'package:mobx/mobx.dart';
part 'perfil_controller.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {

  @observable
  int tempoSemana = 0;

  @observable
  int tempoMes = 0;

  @observable
  int tempoAno = 0;

  @action
  carregaTempo() async {
    await PerfilService().pegarInfoPlantao().then((json) {
      tempoSemana = json['total_semana'];
      tempoMes = json['total_mes'];
      tempoAno = json['total_ano'];
    });
  }
  
}