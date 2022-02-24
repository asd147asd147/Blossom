import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import './theme.dart';
import './homePage.dart';

class Summary extends StatefulWidget {
    @override
    _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

    late CustomTheme customTheme;

    Widget themeBuilder(DefaultTheme theme, Color color, String text) {
        return InkWell(
                onTap: () {
                    customTheme.changeTheme(theme);
                    setState(() {
                        Navigator.pop(context);
                    });
                },
                child: Card(
                               margin: EdgeInsets.symmetric(horizontal: 15),
                               elevation: 3,
                               child: Container(
                                       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                       color: color,
                                       child: Center(
                                               child: Text(
                                                       text,
                                                       textScaleFactor: 1.5,
                                                       style: TextStyle(
                                                               color: CustomTheme.of(context).theme.appBarIconColor,
                                                       ),
                                               ),
                                       ),
                               ),
                       ),
                );
    }

    Widget baseCard() {
        final Size size = MediaQuery.of(context).size;
        return Card(
                margin: EdgeInsets.symmetric(horizontal: 15),
                elevation: 5,
                child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        constraints: BoxConstraints.expand(height: 335),
                        child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    themeBuilder(PinkTheme(), PinkTheme.mainColor, 'Pink'),
                                    themeBuilder(PurpleTheme(), PurpleTheme.mainColor, 'Purple'),
                                    themeBuilder(YellowTheme(), YellowTheme.mainColor, 'Yellow'),
                                    themeBuilder(BlueTheme(), BlueTheme.mainColor, 'Blue'),
                                ],
                        ),
                ),
        );
    }

    @override
    Widget build(BuildContext context) {
        customTheme = context.watch<CustomTheme>();
        return Scaffold(
                appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                ),
                body: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                                children: [
                                    baseCard(),
                                ],
                        ),
                ),
        );
    }
}
