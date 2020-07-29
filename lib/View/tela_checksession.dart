import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckSession extends StatefulWidget {
  @override
  _CheckSessionState createState() => _CheckSessionState();
}

class _CheckSessionState extends State<CheckSession> {
  bool logged = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _checkSession() async {
    await SharedPreferences.getInstance().then((value) {
      setState(() {
        logged = value.getString('loginAuth') != null;
      });
      _navega();
    });
  }

  void _navega() {
    if (logged ?? false)
      Navigator.of(context).popAndPushNamed('/home');
    else
      Navigator.of(context).popAndPushNamed('/home');
    //Navigator.of(context).popAndPushNamed('/acesso');
  }
}
