// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlantaoController on _PlantaoControllerBase, Store {
  final _$startedAtom = Atom(name: '_PlantaoControllerBase.started');

  @override
  bool get started {
    _$startedAtom.reportRead();
    return super.started;
  }

  @override
  set started(bool value) {
    _$startedAtom.reportWrite(value, super.started, () {
      super.started = value;
    });
  }

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

  final _$iniciarPlantaoUserAsyncAction =
      AsyncAction('_PlantaoControllerBase.iniciarPlantaoUser');

  @override
  Future iniciarPlantaoUser() {
    return _$iniciarPlantaoUserAsyncAction
        .run(() => super.iniciarPlantaoUser());
  }

  final _$iniciarPlantaoAmigoAsyncAction =
      AsyncAction('_PlantaoControllerBase.iniciarPlantaoAmigo');

  @override
  Future iniciarPlantaoAmigo() {
    return _$iniciarPlantaoAmigoAsyncAction
        .run(() => super.iniciarPlantaoAmigo());
  }

  final _$fecharPlantaoAsyncAction =
      AsyncAction('_PlantaoControllerBase.fecharPlantao');

  @override
  Future fecharPlantao() {
    return _$fecharPlantaoAsyncAction.run(() => super.fecharPlantao());
  }

  final _$obterStatusPlantaoAsyncAction =
      AsyncAction('_PlantaoControllerBase.obterStatusPlantao');

  @override
  Future obterStatusPlantao() {
    return _$obterStatusPlantaoAsyncAction
        .run(() => super.obterStatusPlantao());
  }

  final _$_PlantaoControllerBaseActionController =
      ActionController(name: '_PlantaoControllerBase');

  @override
  void setStarted(bool iniciado) {
    final _$actionInfo = _$_PlantaoControllerBaseActionController.startAction(
        name: '_PlantaoControllerBase.setStarted');
    try {
      return super.setStarted(iniciado);
    } finally {
      _$_PlantaoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
started: ${started},
duration: ${duration},
loading: ${loading}
    ''';
  }
}
