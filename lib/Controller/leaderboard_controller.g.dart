// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LeaderBoardController on _LeaderBoardControllerBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_LeaderBoardControllerBase.loading'))
      .value;

  final _$loadingNewStateAtom =
      Atom(name: '_LeaderBoardControllerBase.loadingNewState');

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
      AsyncAction('_LeaderBoardControllerBase.setMembrosEj');

  @override
  Future setMembrosEj() {
    return _$setMembrosEjAsyncAction.run(() => super.setMembrosEj());
  }

  final _$fetchDataAsyncAction =
      AsyncAction('_LeaderBoardControllerBase.fetchData');

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
loadingNewState: ${loadingNewState},
loading: ${loading}
    ''';
  }
}
