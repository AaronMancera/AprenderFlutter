import 'package:flutter/material.dart';
import 'package:productos_app/screens/home_screen.dart';
import 'package:productos_app/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      },
      theme:
          ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}
