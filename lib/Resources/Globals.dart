import 'dart:core';

import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Controller/session_controller.dart';
import 'package:megaponto_oficial/main.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Globals {
  static final ThemeData theme = Theme.of(MegaPonto.mainState.currentContext);
  static final TextTheme textTheme = theme.textTheme;
  static final InputDecorationTheme inputTheme = theme.inputDecorationTheme;
  static final Size windowSize =
      MediaQuery.of(MegaPonto.mainState.currentContext).size;
  static final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };
  static final sessionController = Provider.of<SessionController>(
      MegaPonto.mainState.currentContext,
      listen: false);
  static String userId;
}
