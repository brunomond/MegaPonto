// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SessionController on _SessionControllerBase, Store {
  final _$loggedUserAtom = Atom(name: '_SessionControllerBase.loggedUser');

  @override
  Usuario get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(Usuario value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  final _$pontoAtivoAtom = Atom(name: '_SessionControllerBase.pontoAtivo');

  @override
  bool get pontoAtivo {
    _$pontoAtivoAtom.reportRead();
    return super.pontoAtivo;
  }

  @override
  set pontoAtivo(bool value) {
    _$pontoAtivoAtom.reportWrite(value, super.pontoAtivo, () {
      super.pontoAtivo = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_SessionControllerBase.logout');

  @override
  Future logout(BuildContext context) {
    return _$logoutAsyncAction.run(() => super.logout(context));
  }

  final _$_SessionControllerBaseActionController =
      ActionController(name: '_SessionControllerBase');

  @override
  dynamic setUser(Usuario user) {
    final _$actionInfo = _$_SessionControllerBaseActionController.startAction(
        name: '_SessionControllerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_SessionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPonto(bool ativo) {
    final _$actionInfo = _$_SessionControllerBaseActionController.startAction(
        name: '_SessionControllerBase.setPonto');
    try {
      return super.setPonto(ativo);
    } finally {
      _$_SessionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
pontoAtivo: ${pontoAtivo}
    ''';
  }
}
