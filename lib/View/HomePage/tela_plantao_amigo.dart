import 'package:flutter/material.dart';


class PlantaoAmigo extends StatefulWidget {
  @override
  _PlantaoAmigoState createState() => _PlantaoAmigoState();
}

class _PlantaoAmigoState extends State<PlantaoAmigo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 15, 0),
            height: 140,
            child: Text(
              "Pesoas Online",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0))),
              child: Column(
                children: [
                  Text("Quem está na sala?"),
                  Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return _listMembros(context, index);
                        },
                        itemCount: 10,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
