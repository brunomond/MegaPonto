import 'package:flutter/material.dart';
import 'package:megaponto_oficial/main.dart';
import 'package:intl/intl.dart';
import 'package:true_time/true_time.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool iniciado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: <Widget>[
          Container(
          child: RaisedButton(
            onPressed: () {
                setState(() {
                  iniciado = !iniciado;
                });
                  
                  String time = DateFormat.yMd().add_jm().format(
                    DateTime.now().toUtc()
                    );
                  final snackBar = new SnackBar(
                  content: Text(time),
                  duration: Duration(seconds: 5),
                  );

                  _scaffoldKey.currentState.showSnackBar(snackBar);
      
            },
            child: Text(iniciado ? 'Fechar Plantão' : 'Iniciar Plantão', 
            style: TextStyle(fontSize:20)),
          ),
        ),])
      ),
    );
  }


  
  
} 