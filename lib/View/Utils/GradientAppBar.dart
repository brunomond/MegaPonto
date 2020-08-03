import "package:flutter/material.dart";
import 'package:megaponto_oficial/Resources/Globals.dart';

class GradientAppBar extends AppBar {
  final String text;

  GradientAppBar({this.text})
      : super(
            title: Text(text ?? 'Mega Ponto', style: Globals.textTheme.headline3,),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                        colors: [
                  Globals.theme.primaryColor,
                  Globals.theme.accentColor
                ]))));
}
