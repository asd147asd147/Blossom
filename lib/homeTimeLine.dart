import 'package:flutter/material.dart';
import './theme.dart';

class HomeTimeLine extends StatefulWidget {
    @override
    _HomeTimeLineState createState() => _HomeTimeLineState();
}

class _HomeTimeLineState extends State<HomeTimeLine> {
    @override
    Widget build(BuildContext context) {
        return Card(
                margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Container(
                        height: 150,
                        ),
        );
    }
} 
