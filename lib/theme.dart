import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

abstract class DefaultTheme {
    Color get scaffoldBackgroundColor;
    
    Color get appBarIconColor;

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

    Color get addTabTitle;
    Color get addTabText;
    Color get addTabDivider;
    Color get addTabToggleText;
    Color get addTabToggleBack;
    Color get addTabToggleBorder;
    Color get addTabElvatedButton;

    ThemeData get themeData;

}

class PinkTheme extends DefaultTheme {
    static Color mainColor = Color(0xffffb7c5);
    static Color highLightColor = Color(0xffff578b);
    static Color baseColor = Color(0xfff1aab8);
    static Color defaultColor = Color(0xffff79a2);
    static Color textColor = Color(0xffff9faf);
    static Color brightColor = Color(0xfffff3f5);

    @override
    final Color scaffoldBackgroundColor = mainColor;

    final Color appBarIconColor = brightColor;

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

    final Color addTabTitle = highLightColor;
    final Color addTabText = textColor;
    final Color addTabDivider = baseColor;
    final Color addTabToggleText = brightColor;
    final Color addTabToggleBack = highLightColor;
    final Color addTabToggleBorder = highLightColor;
    final Color addTabElvatedButton = mainColor;

    final ThemeData themeData = ThemeData(
            scaffoldBackgroundColor: mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'mood',
    );
}

class PurpleTheme extends DefaultTheme {
    static Color mainColor = Color(0xffdeb7ff);
    static Color highLightColor = Color(0xff9c79ff);
    static Color baseColor = Color(0xffaeabf1);
    static Color defaultColor = Color(0xff8379ff);
    static Color textColor = Color(0xffad9fff);
    static Color brightColor = Color(0xffe7e5ff);

    @override
    final Color scaffoldBackgroundColor = mainColor;

    final Color appBarIconColor = brightColor;

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

    final Color addTabTitle = highLightColor;
    final Color addTabText = textColor;
    final Color addTabDivider = baseColor;
    final Color addTabToggleText = brightColor;
    final Color addTabToggleBack = highLightColor;
    final Color addTabToggleBorder = highLightColor;
    final Color addTabElvatedButton = mainColor;

    final ThemeData themeData = ThemeData(
            scaffoldBackgroundColor: mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'mood',
    );
}

class YellowTheme extends DefaultTheme {
    static Color mainColor = Color(0xfffde88d);
    static Color highLightColor = Color(0xffffd400);
    static Color baseColor = Color(0xffffbd47);
    static Color defaultColor = Color(0xffffd400);
    static Color textColor = Color(0xfff1d665);
    static Color brightColor = Color(0xfffff8e5);

    @override
    final Color scaffoldBackgroundColor = mainColor;

    final Color appBarIconColor = brightColor;

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

    final Color addTabTitle = highLightColor;
    final Color addTabText = textColor;
    final Color addTabDivider = baseColor;
    final Color addTabToggleText = brightColor;
    final Color addTabToggleBack = highLightColor;
    final Color addTabToggleBorder = highLightColor;
    final Color addTabElvatedButton = mainColor;

    final ThemeData themeData = ThemeData(
            scaffoldBackgroundColor: mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'mood',
    );
}

class BlueTheme extends DefaultTheme {
    static Color mainColor = Color(0xff99ccff);
    static Color highLightColor = Color(0xff4595fb);
    static Color baseColor = Color(0xff99ddff);
    static Color defaultColor = Color(0xff04b1fb);
    static Color textColor = Color(0xff68a9fc);
    static Color brightColor = Color(0xffeffcff);

    @override
    final Color scaffoldBackgroundColor = mainColor;

    final Color appBarIconColor = brightColor;

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

    final Color addTabTitle = highLightColor;
    final Color addTabText = textColor;
    final Color addTabDivider = baseColor;
    final Color addTabToggleText = brightColor;
    final Color addTabToggleBack = highLightColor;
    final Color addTabToggleBorder = highLightColor;
    final Color addTabElvatedButton = mainColor;

    final ThemeData themeData = ThemeData(
            scaffoldBackgroundColor: mainColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'mood',
    );
}



class CustomTheme extends InheritedWidget with ChangeNotifier {
    CustomTheme({
        Key? key,
        required this.theme,
        required Widget child,
    }) : super(key: key, child: child);

    DefaultTheme theme;

    @override
    bool updateShouldNotify(CustomTheme old) {
        return true;
    }

    void changeTheme(DefaultTheme newTheme) {
        theme = newTheme;
        notifyListeners();
    } 

    static CustomTheme of(BuildContext context) {
        return context.dependOnInheritedWidgetOfExactType<CustomTheme>()!;
    }
}
