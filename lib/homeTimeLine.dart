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
        List<Map<String, dynamic>> _subject = [
            {'subject': 'Brunch', 'time': '09:00', 'detail': ['Grilled ham, egg & chips', 'Espresso']},
            {'subject': 'Lunch', 'time': '13:00', 'detail': ['Cheeseburger']},
            {'subject': 'Shopping', 'time': '17:50', 'detail': ['Muffler', 'Gloves']},
            {'subject': 'Dinner', 'time': '19:50','detail': ['Beefsteak', 'Houes White Wine']},
            {'subject': 'Stock', 'time': '21:50', 'detail': ['Profit']},
        ];

        List<Map<dynamic, dynamic>> _timeLineInfo = [];
        _subject.forEach((value){
            _timeLineInfo.add({'content': value['subject'], 'oppContent': value['time'], 'type': 0});
            for(int i = 0; i < value['detail'].length; i++){
                _timeLineInfo.add({'content': value['detail'][i], 'oppContent': '', 'type': 1});
            }
        });

        return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Timeline.tileBuilder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        theme: TimelineThemeData(
                                nodePosition: 0.2,
                                indicatorTheme: IndicatorThemeData(
                                        color: CustomTheme.of(context).theme.homeTimelineIndicator,
                                ),
                                connectorTheme: ConnectorThemeData(
                                        color: CustomTheme.of(context).theme.homeTimelineIndicator,
                                        thickness: 2.5,
                                ),
                        ),
                        builder: TimelineTileBuilder.connected(
                                connectionDirection: ConnectionDirection.before,
                                itemCount: _timeLineInfo.length,
                                contentsBuilder: (context, index) {
                                    var _color = CustomTheme.of(context).theme.homeTimelineMainText;
                                    var _fontSize = 15.0;
                                    var _topPad = 0.0;
                                    var _botPad = 8.0;
                                    if(_timeLineInfo[index]['type'] == 1){
                                        _color = CustomTheme.of(context).theme.homeTimelineSubText;
                                        _fontSize = 13.0;
                                        _topPad = -4.0;
                                    }
                                    return ListTile(
                                            contentPadding: EdgeInsets.only(left: 10.0, right: 5.0),
                                            visualDensity: VisualDensity(vertical: _topPad),
                                            onTap: () {},
                                            title: Text(
                                                    _timeLineInfo[index]['content'],
                                                    style: TextStyle(
                                                            color: _color,
                                                            fontSize: _fontSize,
                                                    ),
                                            ),
                                            trailing: Text(
                                                    '20,000',
                                                    style: TextStyle(
                                                            color: _color,
                                                            fontSize: _fontSize,
                                                    ),
                                                    textAlign: TextAlign.right,
                                            ),
                                    );
                                },
                                oppositeContentsBuilder: (context, index) {
                                    var _color = CustomTheme.of(context).theme.homeTimelineMainText;
                                    if(_timeLineInfo[index]['type'] == 1){
                                        _color = CustomTheme.of(context).theme.homeTimelineSubText;
                                    }
                                    return Padding(
                                            padding: const EdgeInsets.only(right: 15.0),
                                            child: Text(
                                                    _timeLineInfo[index]['oppContent'],
                                                    style: TextStyle(color: _color),
                                            ),
                                    );
                                },
                                indicatorBuilder: (_, index) {
                                    var _size = 20.0;
                                    if(_timeLineInfo[index]['type'] == 1){
                                        _size = 10.0;
                                    }
                                    return DotIndicator(
                                            size: _size,
                                    );
                                },
                                connectorBuilder: (_, index, type) {
                                    return Container(
                                            child: SolidLineConnector(
                                                    space: 30,
                                            ),
                                    );
                                },
                                firstConnectorBuilder: (_) {
                                    return Container(
                                            child: SolidLineConnector(),
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
                                    height: 420,
                                    child: PageView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                                timelineBuilder(),
                                                timelineBuilder(),
                                                timelineBuilder(),
                                            ],
                                    ),
                            ),
                            /*ElevatedButton(
                                    child: Text("Go to second page"),
                                    onPressed: () {
                                        Navigator.push(
                                                context, MaterialPageRoute(builder: (_) => Summary()));
                                    },
                            ),*/
                        ],
                ),
        );
    }
} 
