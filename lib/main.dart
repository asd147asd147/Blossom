import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import './homePage.dart';
import './theme.dart';
import './dataBase.dart';

void main() {
    runApp(
            MultiProvider(
                    providers: [
                        ChangeNotifierProvider(create: (_) => Database()),
                        ChangeNotifierProvider(create: (_) => CustomTheme(theme: PinkTheme(), child: HomePage())),
                    ],
                    child: MyApp(),
            ),
    );
}

class MyApp extends StatelessWidget {
    late CustomTheme customTheme;
    @override
    Widget build(BuildContext context) {
        customTheme = context.watch<CustomTheme>();
        return customTheme;
    }
}

