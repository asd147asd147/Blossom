import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import './Summary.dart';
import './theme.dart';

class HomeTimeLine extends StatefulWidget {
    @override
    _HomeTimeLineState createState() => _HomeTimeLineState();
}

class _HomeTimeLineState extends State<HomeTimeLine> {
    Widget timelineBuilder(){
        List<String> _time = ['09:00', '13:00', '17:50', '19:50', '21:50'];
        List<String> _subject = ['Brunch', 'Lunch', 'Shopping', 'Dinner', 'Stock'];

        return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
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
                        );
    }

    @override
    Widget build(BuildContext context) {
        return Card(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                elevation: 5,
                child: Column(
                        children: [
                            Container(
                                    margin: EdgeInsets.only(top: 10, bottom: 0),
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    constraints: BoxConstraints.expand(height: 50),
                                    child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Padding(
                                                        padding: EdgeInsets.only(right: 35),
                                                        child: Icon(
                                                                Icons.navigate_before_rounded,
                                                                color: CustomTheme.of(context).theme.homeTimelineTitle,
                                                                size: 17,
                                                        ),
                                                ),
                                                Text(
                                                        '2022-01-13',
                                                        style: TextStyle(
                                                                color: CustomTheme.of(context).theme.homeTimelineTitle,
                                                                fontSize: 17,
                                                        ),
                                                ),
                                                Padding(
                                                        padding: EdgeInsets.only(left: 35),
                                                        child: Icon(
                                                                Icons.navigate_next_rounded,
                                                                color: CustomTheme.of(context).theme.homeTimelineTitle,
                                                                size: 17,
                                                        ),
                                                ),
                                                ],
                                    ),
                            ),
                            Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Container(
                                                padding: EdgeInsets.only(bottom: 15, right: 30),
                                                child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                            Text(
                                                                    'Income',
                                                                    style: TextStyle(
                                                                            color: CustomTheme.of(context).theme.homeTimelineInfoTitle,
                                                                            fontSize: 13,
                                                                            fontWeight: FontWeight.w500,
                                                                    ),
                                                            ),
                                                            Text(
                                                                    '150,000',
                                                                    style: TextStyle(
                                                                            color: CustomTheme.of(context).theme.homeTimelineInfoText,
                                                                            fontSize: 13,
                                                                    ),
                                                            ),
                                                        ],
                                                ),
                                        ),
                                        Container(
                                                padding: EdgeInsets.only(bottom: 15, left: 30),
                                                child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                            Text(
                                                                    'Expense',
                                                                    style: TextStyle(
                                                                            color: CustomTheme.of(context).theme.homeTimelineInfoTitle,
                                                                            fontSize: 13,
                                                                            fontWeight: FontWeight.w500,
                                                                    ),
                                                            ),
                                                            Text(
                                                                    '80,000',
                                                                    style: TextStyle(
                                                                            color: CustomTheme.of(context).theme.homeTimelineInfoText,
                                                                            fontSize: 13,
                                                                    ),
                                                            ),
                                                        ],
                                                ),
                                        ),
                                    ],
                            ),
                            Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    height: 1.2,
                                    decoration: BoxDecoration(
                                            color: CustomTheme.of(context).theme.homeTimelineIndicator,
                                    ),
                            ),
                            Container(
                                    height: 300,
                                    child: PageView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                                timelineBuilder(),
                                                timelineBuilder(),
                                                timelineBuilder(),
                                            ],
                                    ),
                            ),
                            ElevatedButton(
                                    child: Text("Go to second page"),
                                    onPressed: () {
                                        Navigator.push(
                                                context, MaterialPageRoute(builder: (_) => Summary()));
                                    },
                            ),
                        ],
                ),
        );
    }
} 
