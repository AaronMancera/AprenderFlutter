import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      //50% del alto de la pantalla
      height: size.height * 0.5,
      // color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        //widget renderizado en la tarjeta
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/details',arguments: 'movie-instance' ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                  //Pilla el espacio del contenedor y lo completa
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/loading.gif'),
                  image: NetworkImage('https://via.placeholder.com/300x400')),
            ),
          );
        },
      ),
    );
  }
}
