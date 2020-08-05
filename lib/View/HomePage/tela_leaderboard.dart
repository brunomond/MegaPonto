import 'package:flutter/material.dart';
import 'package:megaponto_oficial/Resources/Globals.dart';
import 'package:megaponto_oficial/presets/custom_icons_icons.dart';

class Leaderboard extends StatefulWidget {
  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
//            Padding(
//              padding: EdgeInsets.fromLTRB(32, 16, 16, 0),
//              child: Text(
//                "RANKING",
//                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
//              ),
//            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Semanal',
                      style: Globals.textTheme.bodyText2.copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Mensal',
                      style: Globals.textTheme.bodyText2,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Anual',
                      style: Globals.textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            _rankeamento(),
          ],
        ),
      ),
    );
  }

  Widget _rankeamento(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('1', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
            CircleAvatar(
              radius: 19,
              backgroundImage: AssetImage('images/abott@adorable.png'),
            ),
            Column(
              children: <Widget>[
                Text('Zoe'),
                Text('15h22min15s'),
              ],
            ),
            Icon(CustomIcons.primeiro),
          ],
        )
      ],
    );
  }
}
