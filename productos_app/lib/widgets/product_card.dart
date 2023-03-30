import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Generar un diseño de mostreo una imagen de un ApiRest
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
            alignment: Alignment.bottomLeft,
            children: const [_BackgroundImage(), _ProductDetails()]),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, 7), blurRadius: 10)
          ]);
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.indigo,
      child: Column(children: const [Text('Producto'),]),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const FadeInImage(
          placeholder: AssetImage('images/jar-loading.gif'),
          image: NetworkImage('https://placehold.co/600x400.png'),
          //Rellena todo el hueco aunque sea la imagen de menor resolucion
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
