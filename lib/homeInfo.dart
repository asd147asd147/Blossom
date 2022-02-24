import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import './theme.dart';
import './dataBase.dart';

class HomeInfo extends StatefulWidget {
    @override
    _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> with SingleTickerProviderStateMixin{
    late TabController _tabController;
    late Database dataBase;

    @override
    void initState() {
        _tabController = TabController(
                length: 4,
                vsync: this,  
        );
        super.initState();
    }

    @override
    void dispose() {
        super.dispose();
        //_tabController.dispose();
    }

    int daysInYear(DateTime date) =>  DateTimeRange(
            start:  DateTime(date.year, 1,1),
            end: DateTime(date.year+1, 1,0))
            .duration
            .inDays;

    int daysInMonth(DateTime date) =>  DateTimeRange(
            start:  DateTime(date.year, date.month,1),
            end: DateTime(date.year, date.month+1))
            .duration
            .inDays;

    List<Widget> expenseBarYearly() {
        List<double> expense = [];
        int maxValue = 1;
        var f = NumberFormat('###,###,###,###');
        List<String> tag = [];
        for(var j = 0; j < 6; j++) {
            int cost = 0;
            var now = DateTime.now();
            var time = DateTime(now.year-j, 1,1);
            for(var i = 0; i < daysInYear(time); i++) {
                var today = DateFormat.yMMMd().format(time.add(Duration(days: i))).toString();
                if(dataBase.data[today] != null) {
                    dataBase.data[today]!.itemList.forEach((value) {
                        if(value.type == 'Expense') {
                            cost += int.parse(value.total.replaceAll(',',''));
                        }
                    });
                }
            }
            maxValue = max(maxValue, cost);
            expense.add(cost.toDouble());
            tag.add(DateFormat.y().format(time).toString());
        }

        tag = tag.reversed.toList();
        return List<Widget>.generate(6, (index){
            return Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                            children: [
                                Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                                f.format(expense[5-index].round()).toString(),
                                                style: TextStyle(
                                                        color: CustomTheme.of(context).theme.homeInfoBarAbove,
                                                        fontSize: 10
                                                ),
                                        ),
                                ),
                                Flexible(
                                        fit: FlexFit.tight,
                                        child: FAProgressBar(
                                                direction: Axis.vertical,
                                                verticalDirection: VerticalDirection.up,
                                             size: 5,
                                                currentValue: (expense[5-index]/maxValue*100).round(),
                                                backgroundColor: CustomTheme.of(context).theme.homeInfoBarBackground,
                                                progressColor: CustomTheme.of(context).theme.homeInfoBarProgress, 
                                        ),
                                ),
                                Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                                tag[index],
                                                style: TextStyle(color: CustomTheme.of(context).theme.homeInfoBarUnder),
                                        ),
                                ),
                                ],
                                ),
                                );
        });
    }

    List<Widget> expenseBarMonthly() {
        List<double> expense = [];
        int maxValue = 1;
        var f = NumberFormat('###,###,###,###');
        List<String> tag = [];
        for(var j = 0; j < 6; j++) {
            int cost = 0;
            var now = DateTime.now();
            var time = DateTime(now.year, now.month-j,1);
            for(var i = 0; i < daysInMonth(time); i++) {
                var today = DateFormat.yMMMd().format(time.add(Duration(days: i))).toString();
                if(dataBase.data[today] != null) {
                    dataBase.data[today]!.itemList.forEach((value) {
                        if(value.type == 'Expense') {
                            cost += int.parse(value.total.replaceAll(',',''));
                        }
                    });
                }
            }
            maxValue = max(maxValue, cost);
            expense.add(cost.toDouble());
            tag.add(DateFormat.MMM().format(time).toString());
        }

        tag = tag.reversed.toList();
        return List<Widget>.generate(6, (index){
            return Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                            children: [
                                Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                                f.format(expense[5-index].round()).toString(),
                                                style: TextStyle(
                                                        color: CustomTheme.of(context).theme.homeInfoBarAbove,
                                                        fontSize: 10
                                                ),
                                        ),
                                ),
                                Flexible(
                                        fit: FlexFit.tight,
                                        child: FAProgressBar(
                                                direction: Axis.vertical,
                                                verticalDirection: VerticalDirection.up,
                                                size: 5,
                                                currentValue: (expense[5-index]/maxValue*100).round(),
                                                backgroundColor: CustomTheme.of(context).theme.homeInfoBarBackground,
                                                progressColor: CustomTheme.of(context).theme.homeInfoBarProgress, 
                                        ),
                                ),
                                Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                                tag[index],
                                                style: TextStyle(color: CustomTheme.of(context).theme.homeInfoBarUnder),
                                        ),
                                ),
                                ],
                                ),
                                );
        });
    }
    
    List<Widget> expenseBarWeekly() {
        List<double> expense = [];
        int maxValue = 1;
        var f = NumberFormat('###,###,###,###');
        for(var j = 0; j < 4; j++) {
            int cost = 0;
            for(var i = 0; i < 7; i++) {
                var time = DateTime.now().subtract(Duration(days:7*j+i));
                var today = DateFormat.yMMMd().format(time).toString();
                if(dataBase.data[today] != null) {
                    dataBase.data[today]!.itemList.forEach((value) {
                        if(value.type == 'Expense') {
                            cost += int.parse(value.total.replaceAll(',',''));
                        }
                    });
                }
            }
            maxValue = max(maxValue, cost);
            expense.add(cost.toDouble());
        }

        List<String> tag = ['3 WA', '2 WA', 'Last', 'This'];
        return List<Widget>.generate(4, (index){
            return Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                            children: [
                                Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                                f.format(expense[3-index].round()).toString(),
                                                style: TextStyle(
                                                        color: CustomTheme.of(context).theme.homeInfoBarAbove,
                                                        fontSize: 10
                                                ),
                                        ),
                                ),
                                Flexible(
                                        fit: FlexFit.tight,
                                        child: FAProgressBar(
                                                direction: Axis.vertical,
                                                verticalDirection: VerticalDirection.up,
                                                size: 5,
                                                currentValue: (expense[3-index]/maxValue*100).round(),
                                                backgroundColor: CustomTheme.of(context).theme.homeInfoBarBackground,
                                                progressColor: CustomTheme.of(context).theme.homeInfoBarProgress, 
                                        ),
                                ),
                                Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                                tag[index],
                                                style: TextStyle(color: CustomTheme.of(context).theme.homeInfoBarUnder),
                                        ),
                                ),
                            ],
                    ),
            );
        });
    }


    List<Widget> expenseBar() {
        List<double> expense = [];
        int maxValue = 1;
        var f = NumberFormat('###,###,###,###');
        for(var i = 0; i < 7; i++) {
            var time = DateTime.now().subtract(Duration(days:i));
            var today = DateFormat.yMMMd().format(time).toString();
            int cost = 0;
            if(dataBase.data[today] != null) {
                dataBase.data[today]!.itemList.forEach((value) {
                    if(value.type == 'Expense') {
                        var temp = int.parse(value.total.replaceAll(',',''));
                        maxValue = max(maxValue, temp);
                        cost += temp;
                    }
                });
            }
            expense.add(cost.toDouble());
        }

        return List<Widget>.generate(7, (index){
            var curDate = DateTime.now().subtract(Duration(days:index));
            return Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                            children: [
                                Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                                f.format(expense[6-index].round()).toString(),
                                                style: TextStyle(
                                                        color: CustomTheme.of(context).theme.homeInfoBarAbove,
                                                        fontSize: 10
                                                ),
                                        ),
                                ),
                                Flexible(
                                        fit: FlexFit.tight,
                                        child: FAProgressBar(
                                                direction: Axis.vertical,
                                                verticalDirection: VerticalDirection.up,
                                                size: 5,
                                                currentValue: (expense[6-index]/maxValue*100).round(),
                                                backgroundColor: CustomTheme.of(context).theme.homeInfoBarBackground,
                                                progressColor: CustomTheme.of(context).theme.homeInfoBarProgress, 
                                        ),
                                ),
                                Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                                DateFormat.E().format(DateTime.now().subtract(Duration(days:6-index))).toString(),
                                                style: TextStyle(color: CustomTheme.of(context).theme.homeInfoBarUnder),
                                        ),
                                ),
                            ],
                    ),
            );
        });
    }

    @override
    Widget build(BuildContext context) {
        dataBase = context.watch<Database>();
        return Card(
                margin: EdgeInsets.symmetric(horizontal: 15),
                elevation: 5,
                child: DefaultTabController(
                        length: 4,
                        child: Column(
                                children: [
                                    Container(
                                            margin: EdgeInsets.only(top: 10, bottom: 0),
                                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                            constraints: BoxConstraints.expand(height: 50),
                                            child: TabBar(
                                                    labelColor: CustomTheme.of(context).theme.homeInfoLabel,
                                                    labelStyle: TextStyle(fontSize: 13.0, fontFamily: 'Mood'),
                                                    indicatorColor: CustomTheme.of(context).theme.homeInfoIndicator,
                                                    indicatorWeight: 4.0,
                                                    indicatorSize: TabBarIndicatorSize.label,
                                                    tabs: [
                                                        Tab(text: 'Daily'),
                                                        Tab(text: 'Weekly'),
                                                        Tab(text: 'Monthly'),
                                                        Tab(text: 'Yearly'),
                                                    ]),
                                    ),
                                    Container(
                                            height: 150,
                                            child: TabBarView(
                                                    children: [
                                                        Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                                child: Row( 
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: expenseBar(),
                                                                ),
                                                        ),
                                                        Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                                child: Row( 
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: expenseBarWeekly(),
                                                                ),
                                                        ),
                                                        Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                                child: Row( 
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: expenseBarMonthly(),
                                                                ),
                                                        ),
                                                        Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                                child: Row( 
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: expenseBarYearly(),
                                                                ),
                                                        ),
                                                        ],),
                                                        ),
                                                        ],),
                                                        ),
                                                        );
    }
}
