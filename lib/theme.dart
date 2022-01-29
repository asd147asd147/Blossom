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
    Color get homeInfoBarBackground;
    Color get homeInfoBarProgress;
    Color get homeInfoBarAbove;
    Color get homeInfoBarUnder;
    Color get homeInfoLabel;
    Color get homeInfoIndicator;

    ThemeData get themeData;

}

class TestPinkTheme extends DefaultTheme {
    static Color mainColor = Color(0xffffb7c5);
    static Color brightnessColor = Color(0xffff578b);
    static Color darkColor = Color(0xfff1aab8);

    @override
    final Color homeInfoLabel = darkColor;
    final Color homeInfoIndicator = mainColor;

    final Color homeInfoBarBackground = mainColor;
    final Color homeInfoBarProgress = brightnessColor;
    final Color homeInfoBarAbove = brightnessColor;
    final Color homeInfoBarUnder = darkColor;

    final ThemeData themeData = ThemeData(
            scaffoldBackgroundColor: mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
    );
}

class CustomTheme extends InheritedWidget {
    const CustomTheme({
        Key? key,
        required this.theme,
        required Widget child,
    }) : super(key: key, child: child);

    final DefaultTheme theme;

    @override
    bool updateShouldNotify(CustomTheme old) => theme != old.theme;

    static CustomTheme of(BuildContext context) {
        return context.dependOnInheritedWidgetOfExactType<CustomTheme>()!;
    }
}
