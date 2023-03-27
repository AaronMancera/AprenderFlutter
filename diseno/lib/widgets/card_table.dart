import 'dart:ui';

import 'package:flutter/material.dart';

//Tabla con toda las cartas añadidas
class CardTable extends StatelessWidget {
  const CardTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const[
        TableRow(children: [
          _SigleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'General'),
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'),
        ]),
        TableRow(children: [
          _SigleCard(color: Colors.purple, icon: Icons.shop, text: 'Shopping'),
          _SigleCard(
              color: Colors.purpleAccent, icon: Icons.cloud, text: 'Bill'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.deepPurple,
              icon: Icons.movie,
              text: 'Entertainment'),
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.food_bank_outlined,
              text: 'Grocery'),
        ]),
        TableRow(children: [
          _SigleCard(
              color: Colors.blue, icon: Icons.border_all, text: 'General'),
          _SigleCard(
              color: Colors.pinkAccent,
              icon: Icons.car_rental,
              text: 'Transport'),
        ]),
      ],
    );
  }
}
//Contenido de cada caja
class _SigleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _SigleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 35,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 18),
        )
      ],
    ));
  }
}
  //Fondo de cada carta con blur

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      //Es necesario poner esto para que el blur se mantenga en el espacio del cuadrado de cada icono de aplicacion, si no se pone, se esaprce por toda la pantalla
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20)),
            child: child,
          ),
        ),
      ),
    );
  }
}
