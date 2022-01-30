import 'package:flutter/material.dart';
import './homeInfo.dart';
import './homeTimeLine.dart';
import './Summary.dart';
import './theme.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
                theme: CustomTheme.of(context).theme.themeData,
                home: Scaffold(
                        appBar: AppBar(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                        ),
                        body: Column(
                                children: <Widget>[
                                    HomeInfo(),
                                    HomeTimeLine(),
                                    ElevatedButton(
                                            child: Text("Go to second page"),
                                            onPressed: () {
                                                Navigator.push(
                                                        context, MaterialPageRoute(builder: (_) => Summary()));
                                            },
                                    ),
                                ],
                        ),
                ),
        );
    }
}
