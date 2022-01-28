import 'package:flutter/material.dart';

class PinkTheme {
    static const Color mainColor = Color(0xffffb7c5);
    static Color lightColor = Color(0xffffc4d2);
    static Color darkColor = Color(0xfff1aab8);
    static Color brightColor = Color(0xfffff3f5);
    static Color brightnessColor = Color(0xffff578b);

    static ThemeData theme = ThemeData(
            primaryColor: mainColor,
            primaryColorDark: darkColor,
            primaryColorLight: lightColor,
            hoverColor: brightnessColor,
            scaffoldBackgroundColor: PinkTheme.mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
    );
}

abstract class DefaultTheme {
    
}

