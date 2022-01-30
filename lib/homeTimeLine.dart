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
        List<String> _time = ['09:00', '13:00', '17:50', '19:50', '21:50'];
        List<String> _subject = ['Brunch', 'Lunch', 'Shopping', 'Dinner', 'Stock'];
        return Card(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                elevation: 5,
                child: Container(
                        child: Timeline.tileBuilder(
                                shrinkWrap: true,
                                theme: TimelineThemeData(
                                        nodePosition: 0.2,
                                        indicatorTheme: IndicatorThemeData(
                                                color: CustomTheme.of(context).theme.homeTimelineIndicator,
                                                size: 20.0,
                                        ),
                                        connectorTheme: ConnectorThemeData(
                                                color: CustomTheme.of(context).theme.homeTimelineIndicator,
                                                thickness: 2.5,
                                        ),
                                ),
                                builder: TimelineTileBuilder.fromStyle(
                                        contentsBuilder: (context, index) => Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Text(
                                                        _subject[index],
                                                        style: TextStyle(color: CustomTheme.of(context).theme.homeTimelineText),
                                                ),
                                        ),
                                        itemCount: _time.length,
                                        oppositeContentsBuilder: (context, index) {
                                            return Padding(
                                                    padding: const EdgeInsets.only(right: 15.0),
                                                    child: Text(
                                                            _time[index],
                                                            style: TextStyle(color: CustomTheme.of(context).theme.homeTimelineText),
                                                    ),
                                            );
                                        },
                                ),
                                ),
                ),
        );
    }
} 
