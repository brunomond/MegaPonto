import 'package:intl/intl.dart';

class Usuario {
  int id;
  String nome;
  String sobrenome;
  String email;
  DateTime nascimento;
  String celular;
  String cpf;
  String rga;
  String imgUrl;
  String token;
  int tokenId;
  bool online; //Apenas para teste

  Usuario();

  Usuario.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.sobrenome = map['sobrenome'];
    this.email = map['email'];
    this.nascimento =
        DateTime.parse(map['nascimento'].toString().replaceAll('/', '-'));
    this.celular = map['celular'];
    this.cpf = (map['cpf'].toString().length > 14) ? map['cpf'] : null;
    this.rga = map['rga'];
    this.imgUrl = map['imagem'];
    this.token = map['token'];
    this.tokenId = map['token_id'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'sobrenome': this.sobrenome,
      'email': this.email,
      'nascimento':
          new DateFormat('dd/MM/yyyy', 'pt-BR').format(this.nascimento),
      'celular': this.celular,
      'cpf': this.cpf,
      'rga': this.rga,
      'imagem': this.imgUrl,
      'token': this.token,
      'token_id': this.tokenId
    };

    return map;
  }
}
