import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        //appbar personalizada desde el main
        appBar: AppBar(
          title: const Text('Películas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () => {
                showSearch(context: context, delegate: MovieSearchDelegate())
              },
            )
          ],
        ),
        //por si sobrepasa en height que se pueda bajar
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              // Listado horizontal de peliculas
              MovieSlider(
                movies: moviesProvider.popularMovies, // populares,
                title: 'Populares', // opcional
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
