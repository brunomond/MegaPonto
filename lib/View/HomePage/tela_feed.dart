import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(65, 3, 76, 1),
                  Color.fromRGBO(199, 59, 34, 1)
                ])),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 40, 15, 0),
              height: 140,
              child: Text("Pessoas Online", style: TextStyle(
                  color: Colors.white
              )),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(50.0),
                          topRight: const Radius.circular(50.0))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: ListView.builder(
                      itemBuilder: (context, index){
                        return _feedCard(context, index);
                      },
                      itemCount: 5,
                    ),
                  ),
                )),
          ],
        ),
    );
  }

  Widget _feedCard(BuildContext context, int index){
      return Padding( 
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Color.fromRGBO(242, 242, 242, 1),
              child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("https://api.adorable.io/avatars/283/abott@adorable.pngCopy to Clipboard"),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 3),
                                child: Text("Morty Smith", style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                              Text("04 de Fevereiro às 16:34", style: TextStyle(
                                fontSize: 14
                              ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"
                          " sed do eiusmod tempor incididunt ut labore et dolore"
                          " magna aliqua. Ut enim ad minim veniam, quis nostrud ",
                      style: TextStyle(
                          fontSize: 13
                      ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10,), child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),)
                  ],
                ),
              ),
            ),
          )
      );
  }
}
