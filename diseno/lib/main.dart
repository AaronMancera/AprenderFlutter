import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home_screen',
        routes: {
          '/basic_desing':(_) => const BasicDseingScreen(),
          '/scroll_desing':(_) => const ScrollDesingScreen(),
          '/home_screen':(_) => const HomeScreen(),


        },
    );
  }
}
