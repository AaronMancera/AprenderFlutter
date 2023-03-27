import 'package:flutter/material.dart';

class ScrollDesingScreen extends StatelessWidget {
  const ScrollDesingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Bakvground imagen
        children: const [
          CustomBackground(),
          MainContent(),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //SafeArea es in widget que permite a los widget del interior adaptarse para no se obstruido por las dimensiones de la pantalla
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Este sizebox deja un espacio entre el inciio al etxto realizando como si fuera un margin top
          const SizedBox(
            height: 30,
          ),
          const Text(
            '11º',
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            'Miércoles',
            style: TextStyle(
                fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          //este expanded deja un hueco entre el icono de la flecha y el texto
          Expanded(child: Container()),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        //Para poner un color hexadecimal tenemos que remover el # y escribir 0xFF
        //      color: Color(#50c2dd), Da Error
        color: const Color(0xFF50c2dd),
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: const Image(image: AssetImage('scroll_1.png')));
  }
}
