import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/AcessPages/tela_login.dart';
import 'package:megaponto_oficial/View/Utils/Gradient.dart';

class Access extends StatefulWidget {
  Access({Key key}) : super(key: key);

  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {

  List<Widget> _telas = [Login()];
  int _selectedItem;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedItem = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackground(),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.22,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0)),
                  color: Colors.white),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _telas[_selectedItem],
                )
            ))
        ],
      ));
  }
}