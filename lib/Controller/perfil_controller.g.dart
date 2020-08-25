// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$tempoSemanaAtom = Atom(name: '_PerfilControllerBase.tempoSemana');

  @override
  int get tempoSemana {
    _$tempoSemanaAtom.reportRead();
    return super.tempoSemana;
  }

  @override
  set tempoSemana(int value) {
    _$tempoSemanaAtom.reportWrite(value, super.tempoSemana, () {
      super.tempoSemana = value;
    });
  }

  final _$tempoMesAtom = Atom(name: '_PerfilControllerBase.tempoMes');

  @override
  int get tempoMes {
    _$tempoMesAtom.reportRead();
    return super.tempoMes;
  }

  @override
  set tempoMes(int value) {
    _$tempoMesAtom.reportWrite(value, super.tempoMes, () {
      super.tempoMes = value;
    });
  }

  final _$tempoAnoAtom = Atom(name: '_PerfilControllerBase.tempoAno');

  @override
  int get tempoAno {
    _$tempoAnoAtom.reportRead();
    return super.tempoAno;
  }

  @override
  set tempoAno(int value) {
    _$tempoAnoAtom.reportWrite(value, super.tempoAno, () {
      super.tempoAno = value;
    });
  }

  final _$carregaTempoAsyncAction =
      AsyncAction('_PerfilControllerBase.carregaTempo');

  @override
  Future carregaTempo() {
    return _$carregaTempoAsyncAction.run(() => super.carregaTempo());
  }

  @override
  String toString() {
    return '''
tempoSemana: ${tempoSemana},
tempoMes: ${tempoMes},
tempoAno: ${tempoAno}
    ''';
  }
}
