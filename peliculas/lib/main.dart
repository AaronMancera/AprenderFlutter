import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

// void main() => runApp(const MyApp());
//Sera el primer widget que va a inicializarse
void main() => runApp(const AppState());

//Creacion de un StatelessWidget para los providers
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //El provider tiene que extender de ChangeNotifier o no sera realmente un provider
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(), 
          //tan pronto como se inicie, se inicializa, no espera a que sea necesitado
          lazy: false,
        )
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
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/details': (_) => const DetailScreen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
