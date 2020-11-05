import 'package:megaponto_oficial/Model/empresaJunior.dart';
import 'package:megaponto_oficial/Services/empresa_junior_service.dart';
import 'package:mobx/mobx.dart';
part 'empresa_junior_controller.g.dart';

class EmpresaJuniorController = _EmpresaJuniorControllerBase with _$EmpresaJuniorController;

abstract class _EmpresaJuniorControllerBase with Store {
  
  _EmpresaJuniorControllerBase(){
      getEjs();
  }

  @observable 
  String selectedEj = '';

  @observable
  List<String> ejs = new List();

  @observable
  List<EmpresaJunior> ejsObject = new List();

  @action
  void setSelectedEj(String value) => selectedEj = value;

  @action
  Future<void> getEjs() async {
    EmpresaJuniorService service = new EmpresaJuniorService();
    ejs = new List();
    ejsObject = new List();
    await service.getEjs().then((value) {
      value.forEach((element) {
        ejs.add(element.nome);
      });
      ejsObject = value;
      selectedEj = value[0].nome;  
    });
  }

  @computed
  EmpresaJunior get userEj => selectedEj != '' ? ejsObject.firstWhere((element) => element.nome == selectedEj) : EmpresaJunior();
}