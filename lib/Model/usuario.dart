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
  String apelido;
  int usuarioId;
  String player_id;
  bool online;
  int total_semana;
  int total_mes;
  int total_ano;
  int empresas_juniore_id;

  Usuario();

  Usuario.fromMap(
      Map map, int horasMensais, int horasAnual, int horasSemanais, int id) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.sobrenome = map['sobrenome'];
    this.apelido = map['apelido'];
    this.email = map['email'];
    this.nascimento = map['nascimento'];
    this.celular = map['celular'];
    this.cpf = (map['cpf'].toString().length > 14) ? map['cpf'] : null;
    this.rga = map['rga'];
    this.imgUrl = map['imagem'];
    this.token = map['token'];
    this.player_id = map['player_id'];
    this.usuarioId = id;
    this.total_semana = horasSemanais;
    this.total_mes = horasMensais;
    this.total_ano = horasAnual;
  }

  Usuario.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.nome = json['nome'],
        this.sobrenome = json['sobrenome'],
        this.apelido = json['apelido'],
        this.email = json['email'],
        this.nascimento = json['nascimento'],
        this.celular = json['celular'],
        this.usuarioId = json['usuario_id'],
        this.cpf = (json['cpf'].toString().length > 14) ? json['cpf'] : null,
        this.rga = json['rga'],
        this.imgUrl = json['imagem'],
        this.token = json['token'],
        this.player_id = json['player_id'],
        this.total_semana = json['total_semana'],
        this.total_mes = json['total_mes'],
        this.total_ano = json['total_ano'],
        this.empresas_juniore_id = json['empresas_juniore_id'];

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'sobrenome': this.sobrenome,
      'apelido': this.apelido,
      'email': this.email,
      'nascimento': this.nascimento,
      //new DateFormat('dd/MM/yyyy', 'pt-BR').format(this.nascimento),
      'celular': this.celular,
      'cpf': this.cpf,
      'rga': this.rga,
      'imagem': this.imgUrl,
      'token': this.token,
      'player_id': this.player_id,
      'total_semana': this.total_semana,
      'total_mes': this.total_mes,
      'total_ano': this.total_ano,
      'empresas_juniore_id' : this.empresas_juniore_id
    };

    return map;
  }
}
