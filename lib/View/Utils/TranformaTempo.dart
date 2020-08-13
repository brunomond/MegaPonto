//import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';

String TransformaTempo(int segundo) {
  //int dias = segundo ~/ 86400;
  //int resto = (segundo % 86400);
  //Duration horas = Duration(seconds: resto + 86399);
  Duration horas = Duration(seconds: segundo);

  //if (dias == 0)
  return "${formatDuration(horas)}";
  //else
  //return "$dias Dias ${formatDuration(horas)}";
}
