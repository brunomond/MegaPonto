import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/FormatDuration.dart';

String TransformaTempo (int segundo) {
  int dias = segundo ~/ 86400;
  int resto = (segundo % 86400);
  Duration horas = Duration(seconds: resto+86399);

  if (dias == 0)
    return "${formatDuration(horas)} Horas";
   else
    return "$dias Dias e ${formatDuration(horas)} Horas";
  //return DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(segundos * 1000))
}