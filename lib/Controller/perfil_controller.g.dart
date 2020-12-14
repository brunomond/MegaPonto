// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  Computed<bool> _$senha2ValidaComputed;

  @override
  bool get senha2Valida =>
      (_$senha2ValidaComputed ??= Computed<bool>(() => super.senha2Valida,
              name: '_PerfilControllerBase.senha2Valida'))
          .value;

  final _$tempoSemanaAtom = Atom(name: '_PerfilControllerBase.tempoSemana');

  @override
  int get tempoSemana {
    _$tempoSemanaAtom.reportRead();
    return super.tempoSemana;
  }

  @override
  set tempoSemana(int value) {
    _$tempoSemanaAtom.reportWrite(value, super.tempoSemana, () {
      super.tempoSemana = value;
    });
  }

  final _$tempoMesAtom = Atom(name: '_PerfilControllerBase.tempoMes');

  @override
  int get tempoMes {
    _$tempoMesAtom.reportRead();
    return super.tempoMes;
  }

  @override
  set tempoMes(int value) {
    _$tempoMesAtom.reportWrite(value, super.tempoMes, () {
      super.tempoMes = value;
    });
  }

  final _$tempoAnoAtom = Atom(name: '_PerfilControllerBase.tempoAno');

  @override
  int get tempoAno {
    _$tempoAnoAtom.reportRead();
    return super.tempoAno;
  }

  @override
  set tempoAno(int value) {
    _$tempoAnoAtom.reportWrite(value, super.tempoAno, () {
      super.tempoAno = value;
    });
  }

  final _$nomeAtom = Atom(name: '_PerfilControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$emailAtom = Atom(name: '_PerfilControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_PerfilControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$confirmacaoSenhaAtom =
      Atom(name: '_PerfilControllerBase.confirmacaoSenha');

  @override
  String get confirmacaoSenha {
    _$confirmacaoSenhaAtom.reportRead();
    return super.confirmacaoSenha;
  }

  @override
  set confirmacaoSenha(String value) {
    _$confirmacaoSenhaAtom.reportWrite(value, super.confirmacaoSenha, () {
      super.confirmacaoSenha = value;
    });
  }

  final _$apelidoAtom = Atom(name: '_PerfilControllerBase.apelido');

  @override
  String get apelido {
    _$apelidoAtom.reportRead();
    return super.apelido;
  }

  @override
  set apelido(String value) {
    _$apelidoAtom.reportWrite(value, super.apelido, () {
      super.apelido = value;
    });
  }

  final _$celularAtom = Atom(name: '_PerfilControllerBase.celular');

  @override
  String get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  final _$idAtom = Atom(name: '_PerfilControllerBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$carregaTempoAsyncAction =
      AsyncAction('_PerfilControllerBase.carregaTempo');

  @override
  Future carregaTempo() {
    return _$carregaTempoAsyncAction.run(() => super.carregaTempo());
  }

  final _$alterarUserAsyncAction =
      AsyncAction('_PerfilControllerBase.alterarUser');

  @override
  Future<bool> alterarUser(int id) {
    return _$alterarUserAsyncAction.run(() => super.alterarUser(id));
  }

  final _$_PerfilControllerBaseActionController =
      ActionController(name: '_PerfilControllerBase');

  @override
  void setNome(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmacaoSenha(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setConfirmacaoSenha');
    try {
      return super.setConfirmacaoSenha(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setApelido(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setApelido');
    try {
      return super.setApelido(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String value) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.setCelular');
    try {
      return super.setCelular(value);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic carregarInfo() {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.carregarInfo');
    try {
      return super.carregarInfo();
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editarPerfil() {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.editarPerfil');
    try {
      return super.editarPerfil();
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic obterDadosUser() {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.obterDadosUser');
    try {
      return super.obterDadosUser();
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tempoSemana: ${tempoSemana},
tempoMes: ${tempoMes},
tempoAno: ${tempoAno},
nome: ${nome},
email: ${email},
senha: ${senha},
confirmacaoSenha: ${confirmacaoSenha},
apelido: ${apelido},
celular: ${celular},
id: ${id},
senha2Valida: ${senha2Valida}
    ''';
  }
}
