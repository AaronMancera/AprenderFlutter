//implementacion de todas las rutas del main organizadas en este sitio
import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/screens/screens.dart';

class AppRoutes {
  //Ruta inicial
  static const initialRoute = '/home';
  //Todas las rutas
  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (context) => const HomeScreen(),
    '/listview1': (context) => const Listview1Screen(),
    '/listview2': (context) => const Listview2Screen(),
    '/alert': (context) => const AlertScreen(),
    '/card': (context) => const CardScreen(),
  };
  //Generador de rutas
  static Route<dynamic> onGenerateRoute( RouteSettings settings) {
    //print(settings);
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
