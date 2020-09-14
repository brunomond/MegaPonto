import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:megaponto_oficial/Services/estado_sala_service.dart';
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
  }

  @action
  Future<void> enviarCafe(BuildContext context) async {
    EstadoSalaService service = new EstadoSalaService();
    await service.alterarHorarioCafe();

    cafe = DateFormat.Hm().format(DateTime.now()) +
        ' de ' +
        DateFormat(DateFormat.WEEKDAY, 'pt_Br').format(DateTime.now());

    OneSignal.shared.postNotification(OSCreateNotification(
        playerIds: ['e2926936-48d7-46c7-a093-169c19b902ee'],
        content: 'Olha o café',
        heading: 'Café feito as $cafe'));

    Navigator.of(context).pop();
  }

  @action
  Future<void> enviarEstadoSala(EstadoSalaEnum estadoEnum) async {
    EstadoSalaService service = new EstadoSalaService();
    estadoSalaEnum = await service.alterarEstadoSala(estadoEnum);
    OneSignal.shared.postNotification(OSCreateNotification(
        playerIds: ['e2926936-48d7-46c7-a093-169c19b902ee'],
        content: '$estadoSalaEnum',
        heading: 'A sala mudou'));
  }
}
