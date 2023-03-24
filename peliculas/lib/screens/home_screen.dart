import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appbar personalizada desde el main
      appBar: AppBar(
        title:const Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon( Icons.search_outlined ),
            onPressed: () => {},
          )
        ],
      ),
      //por si sobrepasa en height que se pueda bajar
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Tarjetas principales
            CardSwiper(),
            // Listado horizontal de peliculas
            MovieSlider(),
            
          ],
        ),
      )
    );
  }
}