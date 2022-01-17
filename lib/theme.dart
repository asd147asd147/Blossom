import 'package:flutter/material.dart';

class PinkTheme {
    static const Color mainColor = Color(0xffffb7c5);
    static const Color lightColor = Color(0xffffc4d2);
    static const Color darkColor = Color(0xfff1aab8);
    static const Color brightColor = Color(0xfffff3f5);

    static ThemeData theme = ThemeData(
            primaryColor: mainColor,
            primaryColorDark: darkColor,
            scaffoldBackgroundColor: PinkTheme.mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
    );
}
