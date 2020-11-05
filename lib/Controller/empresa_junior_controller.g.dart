// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empresa_junior_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmpresaJuniorController on _EmpresaJuniorControllerBase, Store {
  Computed<EmpresaJunior> _$userEjComputed;

  @override
  EmpresaJunior get userEj =>
      (_$userEjComputed ??= Computed<EmpresaJunior>(() => super.userEj,
              name: '_EmpresaJuniorControllerBase.userEj'))
          .value;

  final _$selectedEjAtom =
      Atom(name: '_EmpresaJuniorControllerBase.selectedEj');

  @override
  String get selectedEj {
    _$selectedEjAtom.reportRead();
    return super.selectedEj;
  }

  @override
  set selectedEj(String value) {
    _$selectedEjAtom.reportWrite(value, super.selectedEj, () {
      super.selectedEj = value;
    });
  }

  final _$ejsAtom = Atom(name: '_EmpresaJuniorControllerBase.ejs');

  @override
  List<String> get ejs {
    _$ejsAtom.reportRead();
    return super.ejs;
  }

  @override
  set ejs(List<String> value) {
    _$ejsAtom.reportWrite(value, super.ejs, () {
      super.ejs = value;
    });
  }

  final _$ejsObjectAtom = Atom(name: '_EmpresaJuniorControllerBase.ejsObject');

  @override
  List<EmpresaJunior> get ejsObject {
    _$ejsObjectAtom.reportRead();
    return super.ejsObject;
  }

  @override
  set ejsObject(List<EmpresaJunior> value) {
    _$ejsObjectAtom.reportWrite(value, super.ejsObject, () {
      super.ejsObject = value;
    });
  }

  final _$getEjsAsyncAction =
      AsyncAction('_EmpresaJuniorControllerBase.getEjs');

  @override
  Future<void> getEjs() {
    return _$getEjsAsyncAction.run(() => super.getEjs());
  }

  final _$_EmpresaJuniorControllerBaseActionController =
      ActionController(name: '_EmpresaJuniorControllerBase');

  @override
  void setSelectedEj(String value) {
    final _$actionInfo = _$_EmpresaJuniorControllerBaseActionController
        .startAction(name: '_EmpresaJuniorControllerBase.setSelectedEj');
    try {
      return super.setSelectedEj(value);
    } finally {
      _$_EmpresaJuniorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedEj: ${selectedEj},
ejs: ${ejs},
ejsObject: ${ejsObject},
userEj: ${userEj}
    ''';
  }
}
