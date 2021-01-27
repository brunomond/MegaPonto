// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_noticia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedNoticiaController on _FeedNoticiaControllerBase, Store {
  final _$conteudoAtom = Atom(name: '_FeedNoticiaControllerBase.conteudo');

  @override
  String get conteudo {
    _$conteudoAtom.reportRead();
    return super.conteudo;
  }

  @override
  set conteudo(String value) {
    _$conteudoAtom.reportWrite(value, super.conteudo, () {
      super.conteudo = value;
    });
  }

  final _$tituloAtom = Atom(name: '_FeedNoticiaControllerBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$nomeCriadorAtom =
      Atom(name: '_FeedNoticiaControllerBase.nomeCriador');

  @override
  String get nomeCriador {
    _$nomeCriadorAtom.reportRead();
    return super.nomeCriador;
  }

  @override
  set nomeCriador(String value) {
    _$nomeCriadorAtom.reportWrite(value, super.nomeCriador, () {
      super.nomeCriador = value;
    });
  }

  final _$_FeedNoticiaControllerBaseActionController =
      ActionController(name: '_FeedNoticiaControllerBase');

  @override
  void setNoticia(String value) {
    final _$actionInfo = _$_FeedNoticiaControllerBaseActionController
        .startAction(name: '_FeedNoticiaControllerBase.setNoticia');
    try {
      return super.setNoticia(value);
    } finally {
      _$_FeedNoticiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitulo(String value) {
    final _$actionInfo = _$_FeedNoticiaControllerBaseActionController
        .startAction(name: '_FeedNoticiaControllerBase.setTitulo');
    try {
      return super.setTitulo(value);
    } finally {
      _$_FeedNoticiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCriador(String value) {
    final _$actionInfo = _$_FeedNoticiaControllerBaseActionController
        .startAction(name: '_FeedNoticiaControllerBase.setCriador');
    try {
      return super.setCriador(value);
    } finally {
      _$_FeedNoticiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
conteudo: ${conteudo},
titulo: ${titulo},
nomeCriador: ${nomeCriador}
    ''';
  }
}
