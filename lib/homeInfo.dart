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
                length: 2,
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
        return Center(
                child: Card(
                        child: DefaultTabController(
                                length: 4,
                                child: Column(
                                        children: [
                                            Container(
                                                    constraints: BoxConstraints.expand(height: 50),
                                                    child: TabBar(
                                                            indicatorColor: Theme.of(context).primaryColor,
                                                            labelColor: Theme.of(context).primaryColorDark,
                                                            tabs: [
                                                                Tab(text: 'Daily'),
                                                                Tab(text: 'Weekly'),
                                                                Tab(text: 'Monthly'),
                                                                Tab(text: 'Yearly'),
                                                            ]),
                                            ),
                                            Container(
                                                    height: 150,
                                            ),
                                        ],),
                        ),
                ),
        );
    }
}
