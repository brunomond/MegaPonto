import 'package:flutter/material.dart';
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
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                "RANKING",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    'Semanal',
                    style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Mensal',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Anual',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            _Rankeamento(),
          ],
        ),
      ),
    );
  }

  Widget _Rankeamento(){
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
