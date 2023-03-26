import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

//se necesita tener control en los estados para eliminar y añadir nuevas peliculas
class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;
  const MovieSlider(
      {super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = new ScrollController();
  //inicio
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      // print(scrollController.position.pixels);
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  //finalizacion
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        const SizedBox(
          height: 5,
        ),
        //En este widget pilla todo el tamaño del padre a secas y lo coje el listview sin dar error
        Expanded(
          //Al ser el padre un column el tamaño no esta definido, por lo tanto da error
          child: ListView.builder(
            //controlador de scroll para poder conocer la posicion del scroller
            controller: scrollController,
            //creamos el scroll horizontal
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            itemBuilder: (_, index) {
              return _MoviePoster(widget.movies[index],
                  '${widget.title}-$index-${widget.movies[index].id}');
            },
          ),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  final String heroId;

  const _MoviePoster(this.movie, this.heroId);
  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //imagen encima del texto con colum
      child: Column(children: [
        //La funcion por si le pulsan a la imagen
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, '/details', arguments: movie),
          child: Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //Para evitar que el texto sobrepase su contenedor ponemos
        Text(
          movie.title,
          //puntos suspensivos
          overflow: TextOverflow.ellipsis,
          //cuando sobrepase la linea salta la linea automaticamente
          maxLines: 2,
          //Centrar la imagen
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
