import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

//Se cambia a una aplicacion que va a tener relacionado un provider
void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsServices(),
          // lazy: false, //provocaria que se puede cargar incluso sin logearse
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/home',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
        '/product': (_) => const ProductScreen()
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.indigo,
            elevation: 0,
          )),
    );
  }
}
