import 'package:flutter/material.dart';
import 'package:megaponto_oficial/View/HomePage/Widgets/cardFeed.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CardFeed(lista: List(), index: index);
      },
      itemCount: 5,
    );
  }
}
