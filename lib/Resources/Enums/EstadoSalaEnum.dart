import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';

enum EstadoSalaEnum { NORMAL, REUNIAODIRETORIA, REUNIAOCLIENTE, ERRO }

extension EstadoSalaEnumExtension on EstadoSalaEnum {
  int get value {
    switch (this) {
      case EstadoSalaEnum.NORMAL:
        return 1;
      case EstadoSalaEnum.REUNIAODIRETORIA:
        return 2;
      case EstadoSalaEnum.REUNIAOCLIENTE:
        return 3;
      case EstadoSalaEnum.ERRO:
      default:
        return 83;
    }
  }

  String get title {
    switch (this) {
      case EstadoSalaEnum.NORMAL:
        return 'Sala Normal';
      case EstadoSalaEnum.REUNIAODIRETORIA:
        return 'Reunião da Diretoria';
      case EstadoSalaEnum.REUNIAOCLIENTE:
        return 'Reunião com Cliente';
      case EstadoSalaEnum.ERRO:
      default:
        return 'Requisição Falhou';
    }
  }

  String get description {
    switch (this) {
      case EstadoSalaEnum.NORMAL:
        return 'Clima normal de trabalho';
      case EstadoSalaEnum.REUNIAODIRETORIA:
        return 'Reunião interna da diretoria';
      case EstadoSalaEnum.REUNIAOCLIENTE:
        return 'Reunião com cliente em andamento';
      case EstadoSalaEnum.ERRO:
      default:
        return 'Requisição Falhou';
    }
  }

  IconData get icon {
    switch (this) {
      case EstadoSalaEnum.NORMAL:
        return CustomIcons.clima_normal;
      case EstadoSalaEnum.REUNIAODIRETORIA:
        return CustomIcons.diretoria;
      case EstadoSalaEnum.REUNIAOCLIENTE:
        return CustomIcons.cliente;
      case EstadoSalaEnum.ERRO:
      default:
        return null;
    }
  }

  List<EstadoSalaEnum> get toList {
    return EstadoSalaEnum.values.sublist(0, 3);
  }

  static EstadoSalaEnum responseData(int response) {
    switch (response) {
      case 1:
        return EstadoSalaEnum.NORMAL;
      case 2:
        return EstadoSalaEnum.REUNIAODIRETORIA;
      case 3:
        return EstadoSalaEnum.REUNIAOCLIENTE;
      case 83:
        return EstadoSalaEnum.ERRO;
      default:
        return EstadoSalaEnum.ERRO;
    }
  }
}
