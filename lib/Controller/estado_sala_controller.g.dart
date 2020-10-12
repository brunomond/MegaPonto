// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estado_sala_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstadoSalaController on _EstadoSalaControllerBase, Store {
  final _$estadoSalaEnumAtom =
      Atom(name: '_EstadoSalaControllerBase.estadoSalaEnum');

  @override
  EstadoSalaEnum get estadoSalaEnum {
    _$estadoSalaEnumAtom.reportRead();
    return super.estadoSalaEnum;
  }

  @override
  set estadoSalaEnum(EstadoSalaEnum value) {
    _$estadoSalaEnumAtom.reportWrite(value, super.estadoSalaEnum, () {
      super.estadoSalaEnum = value;
    });
  }

  final _$listaUserAtom = Atom(name: '_EstadoSalaControllerBase.listaUser');

  @override
  List<String> get listaUser {
    _$listaUserAtom.reportRead();
    return super.listaUser;
  }

  @override
  set listaUser(List<String> value) {
    _$listaUserAtom.reportWrite(value, super.listaUser, () {
      super.listaUser = value;
    });
  }

  final _$cafeAtom = Atom(name: '_EstadoSalaControllerBase.cafe');

  @override
  String get cafe {
    _$cafeAtom.reportRead();
    return super.cafe;
  }

  @override
  set cafe(String value) {
    _$cafeAtom.reportWrite(value, super.cafe, () {
      super.cafe = value;
    });
  }

  final _$obterCafeSalaAsyncAction =
      AsyncAction('_EstadoSalaControllerBase.obterCafeSala');

  @override
  Future<void> obterCafeSala() {
    return _$obterCafeSalaAsyncAction.run(() => super.obterCafeSala());
  }

  final _$enviarCafeAsyncAction =
      AsyncAction('_EstadoSalaControllerBase.enviarCafe');

  @override
  Future<void> enviarCafe(BuildContext context) {
    return _$enviarCafeAsyncAction.run(() => super.enviarCafe(context));
  }

  final _$enviarEstadoSalaAsyncAction =
      AsyncAction('_EstadoSalaControllerBase.enviarEstadoSala');

  @override
  Future<void> enviarEstadoSala(EstadoSalaEnum estadoEnum) {
    return _$enviarEstadoSalaAsyncAction
        .run(() => super.enviarEstadoSala(estadoEnum));
  }

  final _$_EstadoSalaControllerBaseActionController =
      ActionController(name: '_EstadoSalaControllerBase');

  @override
  void setCafe(String horario) {
    final _$actionInfo = _$_EstadoSalaControllerBaseActionController
        .startAction(name: '_EstadoSalaControllerBase.setCafe');
    try {
      return super.setCafe(horario);
    } finally {
      _$_EstadoSalaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estadoSalaEnum: ${estadoSalaEnum},
listaUser: ${listaUser},
cafe: ${cafe}
    ''';
  }
}
