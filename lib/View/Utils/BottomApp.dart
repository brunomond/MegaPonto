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
          iconSize: 32,
          showUnselectedLabels: false,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.jornalvazio),
              title: Text(
                'Feed',
                style: TextStyle(fontSize: 10),
              ),
              activeIcon: Icon(CustomIcons.jornal),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.amigovazio),
              title: Text(
                'Plantão Amigo',
                style: TextStyle(fontSize: 10),
              ),
              activeIcon: Icon(CustomIcons.amigo),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.relogiovazio),
              title: Text(
                'MegaPonto',
                style: TextStyle(fontSize: 10),
              ),
              activeIcon: Icon(CustomIcons.relogio),
            ),
            BottomNavigationBarItem(
                icon: Icon(CustomIcons.podiovazio),
                title: Text(
                  'Leaderboard',
                  style: TextStyle(fontSize: 10),
                ),
                activeIcon: Icon(CustomIcons.podio)),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('images/abott@adorable.png'),
                ),
                title: Text('Perfil')),
          ]),
      decoration: BoxDecoration(color: Colors.grey[90], boxShadow: [
        BoxShadow(spreadRadius: 3, blurRadius: 0, offset: Offset(2, 3))
      ]),
    );
  }
}
