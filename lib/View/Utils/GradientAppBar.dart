import "package:flutter/material.dart";
import 'package:megaponto_oficial/Resources/Globals.dart';

class GradientAppBar extends AppBar {
  final String text;
  final List<Widget> actions;

  GradientAppBar({this.text, this.actions})
      : super(
            title: Text(text ?? 'Mega Ponto', style: Globals.textTheme.headline3,),
            actions: actions != null ? actions : null,
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
