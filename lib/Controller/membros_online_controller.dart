import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Services/membros_online_service.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
part 'membros_online_controller.g.dart';

class MembrosOnlineController = _MembrosOnlineControllerBase
    with _$MembrosOnlineController;

abstract class _MembrosOnlineControllerBase with Store {
  
  
  final membrosOnline = BehaviorSubject<List<Usuario>>.seeded(new List<Usuario>());
  ObservableStream<List<Usuario>> membrosOnlineOutput;

  _MembrosOnlineControllerBase() {
    setMembrosOnline();
    membrosOnlineOutput = membrosOnline.stream.asObservable();

  }

  @computed
  int get qtdOnline => membrosOnlineOutput != null && membrosOnlineOutput.data != null ? membrosOnlineOutput.data.length : 0;


  @computed
  bool get loading => membrosOnlineOutput != null && membrosOnlineOutput.data != null && membrosOnlineOutput.data.isEmpty;


  @action
  setMembrosOnline() async {

    await MembrosOnlineService().listarMembrosOnline().then((list) {
      membrosOnline.value = list;
    });
  }
  
  void dispose(){
    membrosOnline.close();
  }
}