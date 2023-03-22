import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/router/app_routes.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //no es const porque se incia en tiempo de ejecucion
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      //Para trabajar con rutas dinamicas, es decir, rutas que no estan escritas arriba, que nos devolvera a la pantalla escrita en el return
      // onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
      //Esto cambiara el thema global de la app sin tener que ir uno a uno
      theme: AppTheme.lightTheme,
    );
  }
}
