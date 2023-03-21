import 'package:flutter/material.dart';
//Pantallas
import 'package:flutter_application_probar_widget/screens/listview1_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //vista personalizada
      home: Listview1Screen()
    );
  }
}