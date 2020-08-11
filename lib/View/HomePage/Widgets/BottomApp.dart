import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/presets/custom_icons_icons.dart';

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
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.black87,
          elevation: 16,
          iconSize: 32,
          showUnselectedLabels: false,
          currentIndex: index,
          items: [
            itemBottomApp(inactiveIcon: CustomIcons.jornalvazio, iconLabel: 'Feed', activeIcon: CustomIcons.jornal),
            itemBottomApp(inactiveIcon: CustomIcons.amigovazio, iconLabel: 'Plantão Amigo', activeIcon: CustomIcons.amigo),
            itemBottomApp(inactiveIcon: CustomIcons.relogiovazio, iconLabel: 'MegaPonto', activeIcon: CustomIcons.relogio),
            itemBottomApp(inactiveIcon: CustomIcons.podiovazio, iconLabel: 'Leaderboard', activeIcon: CustomIcons.podio),
            profileItemBottomApp(assetPath: 'images/abott@adorable.png', label: 'Perfil'),      
          ]),
      decoration: BoxDecoration(color: Colors.grey[90], boxShadow: [
        BoxShadow(spreadRadius: 3, blurRadius: 0, offset: Offset(2, 3))
      ]),
    );
  }

  BottomNavigationBarItem itemBottomApp({IconData inactiveIcon, String iconLabel, IconData activeIcon}){
    return BottomNavigationBarItem(
                icon: Icon(inactiveIcon),
                title: Text(
                  iconLabel,
                  style: TextStyle(fontSize: 10),
                ),
                activeIcon: Icon(activeIcon));
  }

  BottomNavigationBarItem profileItemBottomApp({String imageUrl, String label, String assetPath}){
    return BottomNavigationBarItem(
                    icon: CircleAvatar(
                      radius: 16,
                      backgroundImage: imageUrl != null ? Image.network(imageUrl) : AssetImage(assetPath),
                    ),
                    title: Text('Perfil'));
  }
}
