class Noticia{
  int id;
  String titulo;
  String conteudo;
  String nomeUsuario;
  int usuarioId;
  int empresasJunioreId;
  String created;
  String modified;

  Noticia();
  
  Noticia.fromMap(
      Map map) {
    this.id = map['id'];
    this.titulo = map['titulo'];
    this.conteudo = map['conteudo'];
    this.usuarioId = map['usuario_id'];
    this.empresasJunioreId = map['empresasJunioreId'];
    this.created = map['created'];
    this.modified = map['modified'];

  }
}