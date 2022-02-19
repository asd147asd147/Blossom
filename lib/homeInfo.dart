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
                                                DateFormat.E().format(curDate).toString(),
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
                                                    labelStyle: TextStyle(fontSize: 13.0, ),
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
                                                                child: Text('Weekly Body'),
                                                        ),
                                                        Container(
                                                                child: Text('Monthly Body'),
                                                        ),
                                                        Container(
                                                                child: Text('Yearly Body'),
                                                        ),
                                                    ],),
                                    ),
                                ],),
                ),
                );
    }
}
