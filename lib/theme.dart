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

class CustomTheme extends InheritedWidget {

    final CustomThemeData? customTheme;

    CustomTheme({@required CustomThemeData this.customTheme});

    static CustomThemeData of(BuildContext context) {
        return context
                .dependOnInheritedWidgetOfExactType<CustomTheme>().customTheme;
    }
    
    @override
    bool updateShouldNotify(CustomTheme oldWidget) => customTheme != oldWidget.customTheme;
}

class CustomThemeData {
    final Color mainColor = Colors.red;
}
