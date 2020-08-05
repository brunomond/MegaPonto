import 'package:flutter/material.dart';

String TransformaTempo (int segundo) {
  int dias = segundo ~/ 86400;
  int resto = (segundo % 86400);
  int horas = (resto ~/ 3600);
  resto = (resto % 3600);
  int min = (resto ~/ 60);

  if (dias == 0)
    return "$horas:$min Horas";
   else
    return "$dias Dias e $horas:$min Horas";
  //return DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(segundos * 1000))
}