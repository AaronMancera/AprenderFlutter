import 'package:flutter/material.dart';
//Para que no haya una infinidad de import se crea un indice/libreria de importaciones llamado screens.dart
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //no es const porque se incia en tiempo de ejecucion
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //Sustituimos el home por un llamamiento de una de las rutas creadas
      // home: const CardScreen(),
      initialRoute: '/home',
      routes:{
        '/home':(context) => const HomeScreen(),
        '/listview1':(context) => const Listview1Screen(),
        '/listview2':(context) => const Listview2Screen(),
        '/alert':(context) => const AlertScreen(),
        '/card':(context) => const CardScreen(),
      },
      //Para trabajar con rutas dinamicas, es decir, rutas que no estan escritas arriba, que nos devolvera a la pantalla escrita en el return
      onGenerateRoute: (settings) {
        print(settings);
        return MaterialPageRoute(builder: (context) => const AlertScreen(),);
      },
    );
  }
}