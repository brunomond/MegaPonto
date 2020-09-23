// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantao_amigo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlantaoAmigoController on _PlantaoAmigoControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_PlantaoAmigoControllerBase.loading'))
      .value;

  final _$loadingNewStateAtom =
      Atom(name: '_PlantaoAmigoControllerBase.loadingNewState');

  @override
  bool get loadingNewState {
    _$loadingNewStateAtom.reportRead();
    return super.loadingNewState;
  }

  @override
  set loadingNewState(bool value) {
    _$loadingNewStateAtom.reportWrite(value, super.loadingNewState, () {
      super.loadingNewState = value;
    });
  }

  final _$setMembrosEjAsyncAction =
      AsyncAction('_PlantaoAmigoControllerBase.setMembrosEj');

  @override
  Future setMembrosEj() {
    return _$setMembrosEjAsyncAction.run(() => super.setMembrosEj());
  }

  final _$fetchDataAsyncAction =
      AsyncAction('_PlantaoAmigoControllerBase.fetchData');

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  final _$_alterarPlantaoAmigoAsyncAction =
      AsyncAction('_PlantaoAmigoControllerBase._alterarPlantaoAmigo');

  @override
  Future _alterarPlantaoAmigo(Usuario user, BuildContext context) {
    return _$_alterarPlantaoAmigoAsyncAction
        .run(() => super._alterarPlantaoAmigo(user, context));
  }

  final _$_PlantaoAmigoControllerBaseActionController =
      ActionController(name: '_PlantaoAmigoControllerBase');

  @override
  dynamic alterarPlantao(Usuario user, BuildContext context) {
    final _$actionInfo = _$_PlantaoAmigoControllerBaseActionController
        .startAction(name: '_PlantaoAmigoControllerBase.alterarPlantao');
    try {
      return super.alterarPlantao(user, context);
    } finally {
      _$_PlantaoAmigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _changeOnline(Usuario user) {
    final _$actionInfo = _$_PlantaoAmigoControllerBaseActionController
        .startAction(name: '_PlantaoAmigoControllerBase._changeOnline');
    try {
      return super._changeOnline(user);
    } finally {
      _$_PlantaoAmigoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingNewState: ${loadingNewState},
loading: ${loading}
    ''';
  }
}
