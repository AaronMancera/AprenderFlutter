import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      // color: Colors.red,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Populares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5,),
        //En este widget pilla todo el tamaño del padre a secas y lo coje el listview sin dar error
        Expanded(
          //Al ser el padre un column el tamaño no esta definido, por lo tanto da error
          child: ListView.builder(
            //creamos el scroll horizontal
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (_, index) {
              return _MoviePoster();
            },
          ),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      //imagen encima del texto con colum
      child: Column(children: [
        //La funcion por si le pulsan a la imagen
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/details',
              arguments: 'movie-instance'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              image: NetworkImage('https://via.placeholder.com/300x400'),
              placeholder: AssetImage('assets/images/loading.gif'),
              width: 130,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //Para evitar que el texto sobrepase su contenedor ponemos
        const Text(
          'Proident Lorem enim est quis incididunt et ex. Ex ad irure et magna pariatur consequat excepteur aliquip exercitation consectetur nostrud incididunt. Reprehenderit sint dolor officia dolor ut nisi nisi tempor eiusmod reprehenderit occaecat. Adipisicing minim aute exercitation eiusmod ullamco enim labore aute fugiat est ullamco irure cupidatat adipisicing. Irure qui consequat aute anim non.',
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
