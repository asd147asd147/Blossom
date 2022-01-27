import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import './theme.dart';

class HomeInfo extends StatefulWidget {
    @override
    _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> with SingleTickerProviderStateMixin{
    late TabController _tabController;

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
        List<String> week = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        List<double> expense = [10000,20000,30000,40000,50000,60000,70000];
        return List<Widget>.generate(7, (index){
            var f = NumberFormat('###,###,###,###');
            return Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                            children: [
                                Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                                f.format(expense[index].round()).toString(),
                                                style: TextStyle(color: Theme.of(context).hoverColor, fontSize: 10),
                                        ),
                                ),
                                Flexible(
                                        fit: FlexFit.tight,
                                        child: FAProgressBar(
                                                direction: Axis.vertical,
                                                verticalDirection: VerticalDirection.up,
                                                size: 5,
                                                currentValue: (expense[index]/expense.reduce(max)*100).round(),
                                                backgroundColor: Theme.of(context).primaryColor,
                                                progressColor: Theme.of(context).hoverColor,
                                        ),
                                ),
                                Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                                week[index],
                                                style: TextStyle(color: Theme.of(context).primaryColorDark),
                                        ),
                                ),
                            ],
                    ),
            );
        });
    }

    @override
    Widget build(BuildContext context) {
        print(Theme.of(context).primaryColor);
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
                                                    indicatorColor: Theme.of(context).primaryColor,
                                                    labelColor: Theme.of(context).primaryColorDark,
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
