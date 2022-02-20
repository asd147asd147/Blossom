import 'package:flutter/material.dart';
import 'package:transition/transition.dart';
import 'package:provider/provider.dart';
import './homeInfo.dart';
import './homeTimeLine.dart';
import './theme.dart';
import './Summary.dart';
import './AddTab.dart';

class HomePage extends StatelessWidget {
    late CustomTheme customTheme;
    @override
    Widget build(BuildContext context) {
        customTheme = context.watch<CustomTheme>();
        return MaterialApp(
                debugShowCheckedModeBanner: false,
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
                                                Navigator.push(
                                                        context,
                                                        Transition(
                                                                child: Summary(),
                                                                transitionEffect: TransitionEffect.LEFT_TO_RIGHT),
                                                );
                                            },
                                    ),
                            ),
                        title: Text(
                                'Blossom',
                                style: TextStyle(
                                        color: CustomTheme.of(context).theme.appBarIconColor,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                ),
                        ),
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
