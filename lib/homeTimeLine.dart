import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import './Summary.dart';
import './theme.dart';
import './dataBase.dart';
import './dataBase.dart';

class HomeTimeLine extends StatefulWidget {
    @override
    _HomeTimeLineState createState() => _HomeTimeLineState();
}

class _HomeTimeLineState extends State<HomeTimeLine> {
    late Database dataBase;
    Widget timelineBuilder(){
        var today = DateFormat.yMMMd().format(DateTime.now()).toString();
        List<Map<String, dynamic>> _subject = [];
        if(dataBase.data[today] != null) {
            dataBase.data[today]!.itemList.forEach((value) {
                _subject.add({
                    'subject': value.subject,
                    'time': value.time,
                    'icon': value.iconData,
                    'cost': value.total,
                    'detail': value.detail
                });
            });
        }
        List<Map<dynamic, dynamic>> _timeLineInfo = [];
        _subject.forEach((value){
            _timeLineInfo.add({'content': value['subject'], 'oppContent': value['time'], 'cost': value['cost'], 'icon': value['icon'], 'type': 0});
            for(int i = 0; i < value['detail'].length; i++){
                _timeLineInfo.add({'content': value['detail'][i]['detail'], 'cost': value['detail'][i]['cost'], 'oppContent': '', 'type': 1});
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
                                            title: Text(
                                                    _timeLineInfo[index]['content'],
                                                    style: TextStyle(
                                                            color: _color,
                                                            fontSize: _fontSize,
                                                    ),
                                            ),
                                            trailing: Text(
                                                    _timeLineInfo[index]['cost'],
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
                                                    style: TextStyle(
                                                            color: _color,
                                                            fontSize: 13.0,
                                                    ),
                                            ),
                                    );
                                },
                                indicatorBuilder: (_, index) {
                                    var _size = 20.0;
                                    var _childSize = 15.0;
                                    if(_timeLineInfo[index]['type'] == 1){
                                        _size = 10.0;
                                        _childSize = 0.0;
                                    }
                                    return DotIndicator(
                                            size: _size,
                                            child: Icon(
                                                    _timeLineInfo[index]['icon'],
                                                    color: Colors.white,
                                                    size: _childSize,
                                            ),
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
        final Size size = MediaQuery.of(context).size;
        dataBase = context.watch<Database>();
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
                                    height: size.height * 0.45,
                                    child: PageView(
                                            reverse: true,
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                                timelineBuilder(),
                                            ],
                                    ),
                            ),
                        ],
                ),
        );
    }
} 
