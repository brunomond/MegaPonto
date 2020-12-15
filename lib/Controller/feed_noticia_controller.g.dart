// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_noticia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedNoticiaController on _FeedNoticiaControllerBase, Store {
  final _$noticiaAtom = Atom(name: '_FeedNoticiaControllerBase.noticia');

  @override
  String get noticia {
    _$noticiaAtom.reportRead();
    return super.noticia;
  }

  @override
  set noticia(String value) {
    _$noticiaAtom.reportWrite(value, super.noticia, () {
      super.noticia = value;
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
  String toString() {
    return '''
noticia: ${noticia}
    ''';
  }
}
