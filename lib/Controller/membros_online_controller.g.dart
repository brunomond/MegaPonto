// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membros_online_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MembrosOnlineController on _MembrosOnlineControllerBase, Store {
  Computed<int> _$qtdOnlineComputed;

  @override
  int get qtdOnline =>
      (_$qtdOnlineComputed ??= Computed<int>(() => super.qtdOnline,
              name: '_MembrosOnlineControllerBase.qtdOnline'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_MembrosOnlineControllerBase.loading'))
      .value;

  final _$setMembrosOnlineAsyncAction =
      AsyncAction('_MembrosOnlineControllerBase.setMembrosOnline');

  @override
  Future setMembrosOnline() {
    return _$setMembrosOnlineAsyncAction.run(() => super.setMembrosOnline());
  }

  @override
  String toString() {
    return '''
qtdOnline: ${qtdOnline},
loading: ${loading}
    ''';
  }
}
