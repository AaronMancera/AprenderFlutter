import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.indigo,
      width: double.infinity,
      height: double.infinity,
      child: Stack(children:  [
        const _PurpleBox(),
        const _HeaderIcon(),
        child,
      ]),
    );
  }
}

//  Icono de persona en el header de la pantalla
class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
    );
  }
}

//  Background de la parte del header de la pantalla
class _PurpleBox extends StatelessWidget {
  const _PurpleBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: _purpleBackground(),
      child: Stack(children: const [
        Positioned(
          top: 90,
          left: 30,
          child: _Bubble(),
        ),
        Positioned(
          top: -40,
          left: -30,
          child: _Bubble(),
        ),
        Positioned(
          top: -50,
          right: -20,
          child: _Bubble(),
        ),
        Positioned(
          bottom: -50,
          left: 10,
          child: _Bubble(),
        ),
        Positioned(
          bottom: 120,
          right: 30,
          child: _Bubble(),
        ),
      ]),
    );
  }

  //  Funcion que devuelve la decoracion que vamos a utilizar para el header
  BoxDecoration _purpleBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

//  El wisget de las burbujas de fondo en el header
class _Bubble extends StatelessWidget {
  const _Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
      child: null,
    );
  }
}
