import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import './theme.dart';

class HomeTimeLine extends StatefulWidget {
    @override
    _HomeTimeLineState createState() => _HomeTimeLineState();
}

class _HomeTimeLineState extends State<HomeTimeLine> {
    @override
    Widget build(BuildContext context) {
        return Card(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                elevation: 5,
                child: Container(
                        child: Timeline.tileBuilder(
                                builder: TimelineTileBuilder.fromStyle(
                                        contentsAlign: ContentsAlign.alternating,
                                        contentsBuilder: (context, index) => Padding(
                                                padding: const EdgeInsets.all(24.0),
                                                child: Text('Timeline Event $index'),
                                        ),
                                        itemCount: 10,
                                ),
                        ),
                        height: 1000,
                ),
        );
    }
} 
