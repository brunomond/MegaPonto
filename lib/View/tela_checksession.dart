import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:megaponto_oficial/Model/Usuario.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSession extends StatefulWidget {
  @override
  _CheckSessionState createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _checkSession();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    Timer(Duration(milliseconds: 200), () => _animationController.forward());
    super.initState();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FadeTransition(
        opacity: _animationController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: Globals.windowSize.width * 0.5,
                  width: Globals.windowSize.width * 0.5,
                  child: Image.asset('images/logo_mega_simbolo.png')),
            ],
          ),
        ),
      ),
    );
  }

  void _checkSession() async {
    bool logged = false;
    await SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString('loginJson') != null) {
        Globals.sessionController.setUser(Usuario.fromJson(
            json.decode(prefs.getString('loginJson'))['user']));
        logged = Globals.sessionController.loggedUser != null;
      }

      Timer(Duration(seconds: 3), () => _navega(logged));
    });
  }

  void _navega(bool logged) {
    _animationController.reverse().then((_) => logged
        ? Navigator.of(context).popAndPushNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/login'));
  }
}
