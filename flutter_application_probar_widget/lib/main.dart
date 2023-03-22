import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/router/app_routes.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //no es const porque se incia en tiempo de ejecucion
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // // Elevacion a clase statica
      // initialRoute: AppRoutes.initialRoute,
      initialRoute: AppRoutes.initialRoute,
      // routes:{
      //   '/home':(context) => const HomeScreen(),
      //   '/listview1':(context) => const Listview1Screen(),
      //   '/listview2':(context) => const Listview2Screen(),
      //   '/alert':(context) => const AlertScreen(),
      //   '/card':(context) => const CardScreen(),
      // },
      // routes: AppRoutes.routes,
      routes: AppRoutes.getAppRoutes(),
      //Para trabajar con rutas dinamicas, es decir, rutas que no estan escritas arriba, que nos devolvera a la pantalla escrita en el return
      // onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
    );
  }
}
