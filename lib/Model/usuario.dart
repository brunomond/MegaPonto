class Usuario {
  int id;
  String nome;
  String sobrenome;
  String email;
  String nascimento;
  String celular;
  String cpf;
  String rga;
  String imgUrl;
  String token;
  String player_id;
  bool online; //Apenas para teste

  Usuario();

  Usuario.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.sobrenome = map['sobrenome'];
    this.email = map['email'];
    this.nascimento = map['nascimento'];
    this.celular = map['celular'];
    this.cpf = (map['cpf'].toString().length > 14) ? map['cpf'] : null;
    this.rga = map['rga'];
    this.imgUrl = map['imagem'];
    this.token = map['token'];
    this.player_id = map['player_id'];
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.nome = json['nome'],
        this.sobrenome = json['sobrenome'],
        this.email = json['email'],
        this.nascimento = json['nascimento'],
        this.celular = json['celular'],
        this.cpf = (json['cpf'].toString().length > 14) ? json['cpf'] : null,
        this.rga = json['rga'],
        this.imgUrl = json['imagem'],
        this.token = json['token'],
        this.player_id = json['player_id'];

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'sobrenome': this.sobrenome,
      'email': this.email,
      'nascimento': this.nascimento,
      //new DateFormat('dd/MM/yyyy', 'pt-BR').format(this.nascimento),
      'celular': this.celular,
      'cpf': this.cpf,
      'rga': this.rga,
      'imagem': this.imgUrl,
      'token': this.token
    };

    return map;
  }
}
