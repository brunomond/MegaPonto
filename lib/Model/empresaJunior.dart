import 'package:megaponto_oficial/Resources/Enums/EstadoSalaEnum.dart';

class EmpresaJunior {

  int id;
  String nome;
  DateTime dataCafe;
  EstadoSalaEnum estadoSalaEnum;


  EmpresaJunior();

  EmpresaJunior.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.nome = json['name'];
}