import 'package:flutter/material.dart';
import './homeInfo.dart';
import './homeTimeLine.dart';
import './theme.dart';
import './Summary.dart';
import './AddTab.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
                theme: CustomTheme.of(context).theme.themeData,
                home: HomeScreen(),
        );
    }
}

class HomeScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
                appBar: AppBar(
                        leading: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: IconButton(
                                            icon: Icon(Icons.settings),
                                            color: CustomTheme.of(context).theme.appBarIconColor,
                                            onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (_) => Summary()));
                                            },
                                    ),
                            ),
                        /*Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Icon(Icons.menu),
                        ),*/
                        title: Text('JuneBank'),
                        actions: [
                            Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: IconButton(
                                            icon: Icon(Icons.add),
                                            color: CustomTheme.of(context).theme.appBarIconColor,
                                            onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (_) => AddTab()));
                                            },
                                    ),
                            ),
                        ],
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                ),
                        body: Column(
                                children: <Widget>[
                                    HomeInfo(),
                                    HomeTimeLine(),
                                ],
                        ),
                );
    }
}
