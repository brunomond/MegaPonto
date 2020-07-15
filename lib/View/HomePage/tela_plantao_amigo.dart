import 'package:flutter/material.dart';


class PlantaoAmigo extends StatefulWidget {
  @override
  _PlantaoAmigoState createState() => _PlantaoAmigoState();
}

class _PlantaoAmigoState extends State<PlantaoAmigo> {
  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Text("Quem está na sala?"),
                  Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return _listMembros(context, index);
                        },
                        itemCount: 10,
                      ))
                ],);
  }

  Widget _listMembros(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 30),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard"),
              ),
            ),
          ),
          Text("Rick Sanchez"),
          Text("IOS"),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 255, 0, 1),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
