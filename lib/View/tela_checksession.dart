import 'dart:async';

import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSession extends StatefulWidget {
  @override
  _CheckSessionState createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  bool logged = false;
  bool _visible = false;

  @override
  void initState() {
    _checkSession();
    _animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
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
    await SharedPreferences.getInstance().then((value) {
      setState(() {
        logged = value.getString('loginAuth') != null;
      });
      Timer(Duration(seconds: 3), () => _navega());
    });
  }

  void _navega() {
     _animationController.reverse().then((value) => logged ?? false ?  Navigator.of(context).popAndPushNamed('/home') : Navigator.of(context).pushReplacementNamed('/login'));
//    if (logged ?? false)
//
//    else
//      ;
  }
}
