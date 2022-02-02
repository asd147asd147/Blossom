import 'package:flutter/material.dart';

abstract class DefaultTheme {
    Color get scaffoldBackgroundColor;

    Color get homeInfoBarBackground;
    Color get homeInfoBarProgress;

    Color get homeInfoBarAbove;
    Color get homeInfoBarUnder;
    Color get homeInfoLabel;
    Color get homeInfoIndicator;

    Color get homeTimelineTitle;
    Color get homeTimelineInfoTitle;
    Color get homeTimelineInfoText;
    Color get homeTimelineIndicator;
    Color get homeTimelineMainText;
    Color get homeTimelineSubText;

    ThemeData get themeData;

}

class PinkTheme extends DefaultTheme {
    static Color mainColor = Color(0xffffb7c5);
    static Color highLightColor = Color(0xffff578b);
    static Color baseColor = Color(0xfff1aab8);
    static Color defaultColor = Color(0xffff79a2);
    static Color textColor = Color(0xffff9faf);

    @override
    final Color scaffoldBackgroundColor = mainColor;

    final Color homeInfoLabel = baseColor;
    final Color homeInfoIndicator = mainColor;

    final Color homeInfoBarBackground = mainColor;
    final Color homeInfoBarProgress = highLightColor;
    final Color homeInfoBarAbove = highLightColor;
    final Color homeInfoBarUnder = baseColor;

    final Color homeTimelineTitle = baseColor;
    final Color homeTimelineInfoTitle = highLightColor;
    final Color homeTimelineInfoText = defaultColor;
    final Color homeTimelineIndicator = defaultColor;
    final Color homeTimelineMainText = defaultColor;
    final Color homeTimelineSubText = textColor;

    final ThemeData themeData = ThemeData(
            scaffoldBackgroundColor: mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
    );
}

class PurpleTheme extends DefaultTheme {
    static Color mainColor = Color(0xffdeb7ff);
    static Color highLightColor = Color(0xff83578b);
    static Color baseColor = Color(0xffaeabf1);
    static Color defaultColor = Color(0xff8379ff);
    static Color textColor = Color(0xffad9fff);

    @override
    final Color scaffoldBackgroundColor = mainColor;

    final Color homeInfoLabel = baseColor;
    final Color homeInfoIndicator = mainColor;

    final Color homeInfoBarBackground = mainColor;
    final Color homeInfoBarProgress = highLightColor;
    final Color homeInfoBarAbove = highLightColor;
    final Color homeInfoBarUnder = baseColor;

    final Color homeTimelineTitle = baseColor;
    final Color homeTimelineInfoTitle = highLightColor;
    final Color homeTimelineInfoText = defaultColor;
    final Color homeTimelineIndicator = defaultColor;
    final Color homeTimelineMainText = defaultColor;
    final Color homeTimelineSubText = textColor;

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
