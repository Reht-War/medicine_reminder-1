import 'package:flutter/material.dart';

import 'content_card.dart';
import 'gooey_carousel.dart';

class GooeyEdgeDemo extends StatefulWidget {
  GooeyEdgeDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GooeyEdgeDemoState createState() => _GooeyEdgeDemoState();
}

class _GooeyEdgeDemoState extends State<GooeyEdgeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GooeyCarousel(
        children: <Widget>[
          ContentCard(
            color: 'Red',
            altColor: Color(0xFF4259B2),
            title: "Patient",
            subtitle: 'Let us focus on your medicines',
          ),
          ContentCard(
            color: 'Yellow',
            altColor: Color(0xFF121212),
            title: "Med-Reminder",
            subtitle: '',
          ),
          ContentCard(
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            title: "Caregiver",
            subtitle: 'Take care of your loved ones conveniently',
          ),
        ],
      ),
    );
  }
}
