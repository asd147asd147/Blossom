import 'package:flutter/material.dart';
import './theme.dart';

class HomeInfo extends StatefulWidget {
    @override
    _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {

    @override
    void initState() {
        //_tabController = TabController(lenght: 2, vsync: this);
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
                        color: BankTheme.brightColor,
                        child: Column(
                                children: [ 
                                Container(
                                        child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    InkWell(
                                                            child: Container(
                                                                    padding: EdgeInsets.all(12.0),
                                                                    child: Text('Info'),
                                                            ),
                                                    ),
                                                    InkWell(
                                                            child: Container(
                                                                    padding: EdgeInsets.all(12.0),
                                                                    child: Text('History'),
                                                            ),
                                                    ),
                                                ]),
                                        ),
                                ListTile(
                                        title: Text('Hello Bank'),
                                ),
                                ]),
                        ),
            );
    }
}
