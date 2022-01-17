import 'package:flutter/material.dart';
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

    @override
    Widget build(BuildContext context) {
        return Card(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: DefaultTabController(
                        length: 4,
                        child: Column(
                                children: [
                                    Container(
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
                                                                child: Text('Daily Body'),
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
