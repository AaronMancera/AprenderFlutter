import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/screens/listview1_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Componentes en Flutter"),
          elevation: 0,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.arrow_circle_right),
                  title: const Text("Nombre ruta"),
                  onTap: () {
                    // // // Forma 1
                    // // Esta forma es mas personalizada (animaciones, formas, etc)
                    // final route = MaterialPageRoute(builder: (context) => const Listview1Screen());
                    // Navigator.push(context, route);
                    // // Navega y destruye la navigacion hacia la pagina anterior
                    // // Navigator.pushReplacement(context, route);
                    // // // Forma 2
                    // // Funciona mediante los nombres que han sido introducidos a main
                    Navigator.pushNamed(context, '/listview2');
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: 10));
  }
}
