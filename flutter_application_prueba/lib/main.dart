import 'package:flutter/material.dart';

//Exportacion de pantallas creada - Logica de creacion de widget
import 'package:flutter_application_prueba/screens/home_screen.dart';

void main() {
  //Warning: Los windget StatelessWidght deben de iniciarse con const
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Warning: En las ultimas versiones de flutter, los datos y widget de estado fijo, es decir; nunca cambian, deben de ser const
    return const MaterialApp(
      //Elimina la etique de debug arriba a la izquierda
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}
