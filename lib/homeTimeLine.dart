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
                                theme: TimelineThemeData(
                                        //nodePosition: 0,
                                        indicatorTheme: IndicatorThemeData(
                                                size: 10.0,
                                        ),
                                        connectorTheme: ConnectorThemeData(
                                                thickness: 2.5,
                                        ),
                                ),
                                builder: TimelineTileBuilder.fromStyle(
                                        contentsBuilder: (context, index) => Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Text('Timeline Event $index'),
                                        ),
                                        itemCount: 10,
                                        oppositeContentsBuilder: (context, index) {
                                            return Padding(
                                                    padding: const EdgeInsets.only(left: 15.0),
                                                    child: Text('L $index'),
                                            );
                                        },
                                ),
                                ),
                        height: 300,
                ),
        );
    }
} 
