// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidEmailComputed;

  @override
  bool get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<bool>(() => super.isValidEmail,
              name: '_LoginControllerBase.isValidEmail'))
          .value;
  Computed<bool> _$isValidPassComputed;

  @override
  bool get isValidPass =>
      (_$isValidPassComputed ??= Computed<bool>(() => super.isValidPass,
              name: '_LoginControllerBase.isValidPass'))
          .value;
  Computed<bool> _$loginPressedComputed;

  @override
  bool get loginPressed =>
      (_$loginPressedComputed ??= Computed<bool>(() => super.loginPressed,
              name: '_LoginControllerBase.loginPressed'))
          .value;
  Computed<IconData> _$iconVisibilityComputed;

  @override
  IconData get iconVisibility => (_$iconVisibilityComputed ??=
          Computed<IconData>(() => super.iconVisibility,
              name: '_LoginControllerBase.iconVisibility'))
      .value;

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$visibleAtom = Atom(name: '_LoginControllerBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVisibility() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.toggleVisibility');
    try {
      return super.toggleVisibility();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
visible: ${visible},
loading: ${loading},
isValidEmail: ${isValidEmail},
isValidPass: ${isValidPass},
loginPressed: ${loginPressed},
iconVisibility: ${iconVisibility}
    ''';
  }
}
