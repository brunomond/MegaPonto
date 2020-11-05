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
  static const String BASE_URL = 'https://paineljunior.com.br/api';
  static final Size windowSize =
      MediaQuery.of(MegaPonto.mainState.currentContext).size;
  static final sessionController = Provider.of<SessionController>(
      MegaPonto.mainState.currentContext,
      listen: false);
  static String userId;
  static String token = sessionController.loggedUser.token;
  static final Map<String, String> noAuthToken = {
        HttpHeaders.contentTypeHeader: 'application/json'
  };
  static final Map<String, String> tokenHeader = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        "Bearer ${sessionController.loggedUser.token}"
  };
}
