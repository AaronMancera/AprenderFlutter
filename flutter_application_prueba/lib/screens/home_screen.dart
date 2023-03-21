import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //La key nos sirve para hacer referencia al contexto de la view
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30=TextStyle(fontSize: 30);
    //Scaffold va a tener body en vez de child. Diseño de pantalla por defecto con fondo blanco, lienzo para poner los demas widget dentro
    return Scaffold(
      //Cambiar el background color
      //backgroundColor: Colors.blue,
      //Para un appbar hay que utilizar otro wideget dentro
      //Error: Como el appbar no tiene constructor constante debemos de quitar el const
      appBar: AppBar(
        title: const Text('Appbar'),
        //sombrita
        elevation: 0,
      ),
      //la columna no puede tener const Center
      body: Center(
        //Para un solo hijo child, para mas Column o Row con children
        //child: Text('Click Counter'),
        child: Column(
          //Centrado verticalmente - El center lo centra horizontal
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('Click Counter',style: fontSize30,),
            Text('0', style: fontSize30,),
          ],
        ),
      ),
    );
  }
}
