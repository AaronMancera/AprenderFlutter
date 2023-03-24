import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar luego por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        //sliver son widgets con cierto procedimiento reporgramados para cuando se ejecuten
        //solo se pueden metera qui aquellos widgets que estan relacionados con sliver
        slivers: [
          _CustomAppBar(),
          //Aqui si se pueden meter lso widgets normales
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),

              
              ]),
          )
        ],
      ),
    );
  }
}

/*
  Clase de creacion un appbar personalizado sliver, con funcionalidad de expandirse y contraerse dependiendo del dezplazamiento de la pantalla
*/
class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cuando haces scroll desaparece el appbar - Parecido pero con comportamientos adicionales
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      //nunca desaparece
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.black12,
            child: const Text(
              'movie-title',
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/300x400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/*
  Clase que contiene los widgets que esta relacionado con la parte de abajo del appbar poster y el titulo
*/
class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie-title',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textTheme.headlineSmall,
              ),
              Text(
                'movie-title.originalTitle',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textTheme.titleMedium,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverange',
                    style: textTheme.bodySmall,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(
          'Ex dolor exercitation ipsum aliqua id consequat laboris eiusmod. Velit proident ea tempor amet esse incididunt duis sunt nisi consectetur fugiat pariatur. Officia sint ex pariatur laboris exercitation ullamco tempor est officia. Veniam velit labore cupidatat quis fugiat irure laborum.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}
