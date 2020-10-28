import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/Model/usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/Services/estado_sala_service.dart';
import 'package:megaponto_oficial/Services/plantao_amigo_service.dart';
import 'package:mobx/mobx.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';
part 'estado_sala_controller.g.dart';

class EstadoSalaController = _EstadoSalaControllerBase
    with _$EstadoSalaController;

abstract class _EstadoSalaControllerBase with Store {
  _EstadoSalaControllerBase() {
    obterCafeSala();
  }

  @observable
  EstadoSalaEnum estadoSalaEnum = EstadoSalaEnum.NORMAL;

  @observable
  String cafe = "";

  @observable
  List<String> listPlayerId = List();

  @action
  void setCafe(String horario) => cafe = horario;

  @action
  void setEstadoSala(EstadoSalaEnum estadoSala) => estadoSalaEnum = estadoSala;

  @action
  Future<void> obterCafeSala() async {
    await EstadoSalaService().getSalaCafe().then((map) {
      DateTime timeCofe = DateTime.parse(map['cafe']).toLocal();

      initializeDateFormatting('pt_Br', null);

      cafe = DateFormat.Hm().format(timeCofe) +
          ' de ' +
          DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(timeCofe);

      estadoSalaEnum =
          EstadoSalaEnumExtension.responseData(int.parse(map['status']));
    });

    await PlantaoAmigoService().mostrarAmigos().then((list) {
      listPlayerId.add(Globals.sessionController.loggedUser.player_id);
      list.forEach((element) {
        Usuario user = element;
        if (!listPlayerId.contains(user.player_id))
          listPlayerId.add(user.player_id);
      });
    });
  }

  @action
  Future<void> enviarCafe(BuildContext context) async {
    EstadoSalaService service = new EstadoSalaService();
    await service.alterarHorarioCafe();

    cafe = DateFormat.Hm().format(DateTime.now()) +
        ' de ' +
        DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now());

    OneSignal.shared.postNotification(OSCreateNotification(
        playerIds: listPlayerId,
        androidLargeIcon: 'ic_onesignal_large_icon_default_cofe',
        heading: 'Olha o café',
        content: 'Café feito as $cafe'));

    Navigator.of(context).pop();
  }

  @action
  Future<void> enviarEstadoSala(EstadoSalaEnum estadoEnum) async {
    EstadoSalaService service = new EstadoSalaService();
    estadoSalaEnum = await service.alterarEstadoSala(estadoEnum);
    String largeIcon = "";

    switch (estadoSalaEnum.title) {
      case 'Sala Normal':
        largeIcon = "ic_onesignal_large_icon_default_sala_normal";
        break;
      case 'Reunião da Diretoria':
        largeIcon = "ic_onesignal_large_icon_default_sala_diretoria";
        break;
      case 'Reunião com Cliente':
        largeIcon = "ic_onesignal_large_icon_default_sala_cliente";
        break;
      default:
    }

    OneSignal.shared.postNotification(OSCreateNotification(
        playerIds: listPlayerId,
        heading: '${estadoSalaEnum.title}',
        content: '${estadoSalaEnum.description}',
        androidLargeIcon: largeIcon));
  }
}
