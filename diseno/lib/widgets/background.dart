import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const boxDecoration = BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
          0.2,
          0.8
        ],
            colors: [
          Color.fromRGBO(1, 29, 119, 1),
          Color.fromRGBO(0, 108, 209, 1)
        ]));
    return Stack(
      children: [
        Container(
          //Gradiant
          decoration: boxDecoration,
        ),
        //Pink box
        Positioned(
          //Tamaño que varia en funcion del tamaño de la pantalla
          top: size.height*-0.2,
          left: size.width*0.08,
          // top: 100, 
          // left: 30, 
          child: const _PinkBox()),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromARGB(235, 188, 1, 179),
              Color.fromARGB(240, 172, 1, 121)
            ])),
      ),
    );
  }
}
