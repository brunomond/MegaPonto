import 'package:flutter/material.dart';
import 'package:megaponto_oficial/presets/custom_icons_icons.dart';

class BottomApp extends StatelessWidget {
  final int index;
  final Function onTap;
  BottomApp({Key key, this.index, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.grey[90],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromRGBO(61, 1, 78, 1),
          unselectedItemColor: Colors.black87,
          elevation: 16,
          iconSize: 36,
          showUnselectedLabels: false,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.jornal), title: Text('Feed')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.amigo), title: Text('Plantão Amigo')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.relogio), title: Text('MegaPonto')),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.podio), title: Text('Leaderboard')),

            BottomNavigationBarItem(
                icon: Icon(CustomIcons.clima_normal), title: Text('Perfil')),
          ]),
      decoration: BoxDecoration(color: Colors.grey[90], boxShadow: [
        BoxShadow(spreadRadius: 3, blurRadius: 0, offset: Offset(2, 3))
      ]),
    );
  }
}
