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
                    ],
                    child: MyApp(),
            ),
    );
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return CustomTheme(
                theme: PinkTheme(),
                child: HomePage(),
        );
    }
}

