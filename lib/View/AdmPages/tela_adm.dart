import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/Utils/GradientAppBar.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/BottomApp.dart';

//telas
import 'package:megaponto_oficial/View/AdmPages/tela_edit_funcionario.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_editar_aplicativo.dart';
import 'package:megaponto_oficial/View/AdmPages/tela_editar.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedItem;
  List<Widget> _telas = [
    AdmEdit(),
    EditarFuncionario(),
    EditarAplicativo(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() => _selectedItem = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        text: 'Administrador',
      ),
      key: _scaffoldKey,
      bottomNavigationBar: BottomApp(
        index: 4,
      ),
      body: _telas[_selectedItem],
    );
  }
}
