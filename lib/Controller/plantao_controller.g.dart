// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlantaoController on _PlantaoControllerBase, Store {
  final _$durationAtom = Atom(name: '_PlantaoControllerBase.duration');

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  final _$loadingAtom = Atom(name: '_PlantaoControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$iniciarPlantaoAmigoAsyncAction =
      AsyncAction('_PlantaoControllerBase.iniciarPlantaoAmigo');

  @override
  Future<void> iniciarPlantaoAmigo() {
    return _$iniciarPlantaoAmigoAsyncAction
        .run(() => super.iniciarPlantaoAmigo());
  }

  final _$fecharPlantaoAmigoAsyncAction =
      AsyncAction('_PlantaoControllerBase.fecharPlantaoAmigo');

  @override
  Future<void> fecharPlantaoAmigo() {
    return _$fecharPlantaoAmigoAsyncAction
        .run(() => super.fecharPlantaoAmigo());
  }

  final _$iniciarPlantaoUserAsyncAction =
      AsyncAction('_PlantaoControllerBase.iniciarPlantaoUser');

  @override
  Future<void> iniciarPlantaoUser() {
    return _$iniciarPlantaoUserAsyncAction
        .run(() => super.iniciarPlantaoUser());
  }

  final _$fecharPlantaoAsyncAction =
      AsyncAction('_PlantaoControllerBase.fecharPlantao');

  @override
  Future<void> fecharPlantao() {
    return _$fecharPlantaoAsyncAction.run(() => super.fecharPlantao());
  }

  final _$_PlantaoControllerBaseActionController =
      ActionController(name: '_PlantaoControllerBase');

  @override
  void setLoading(bool carregando) {
    final _$actionInfo = _$_PlantaoControllerBaseActionController.startAction(
        name: '_PlantaoControllerBase.setLoading');
    try {
      return super.setLoading(carregando);
    } finally {
      _$_PlantaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(Duration duracao) {
    final _$actionInfo = _$_PlantaoControllerBaseActionController.startAction(
        name: '_PlantaoControllerBase.setDuration');
    try {
      return super.setDuration(duracao);
    } finally {
      _$_PlantaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
duration: ${duration},
loading: ${loading}
    ''';
  }
}
