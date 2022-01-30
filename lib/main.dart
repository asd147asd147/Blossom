import 'package:flutter/material.dart';
import './homePage.dart';
import './theme.dart';

void main() {
    runApp(MyApp());
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

