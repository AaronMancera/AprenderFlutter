import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  //La key nos sirve para hacer referencia al contexto de la view
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //Para que cambie y atribuir este valor al estado hay que elevarlo en la clase
  int contador = 2;
  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    contador--;
    setState(() {});
  }

  void resetear() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(fontSize: 30);
    //Scaffold va a tener body en vez de child. Diseño de pantalla por defecto con fondo blanco, lienzo para poner los demas widget dentro
    return Scaffold(
      //Cambiar el background color
      //backgroundColor: Colors.blue,
      //Para un appbar hay que utilizar otro wideget dentro
      //Error: Como el appbar no tiene constructor constante debemos de quitar el const
      appBar: AppBar(
        title: const Text('CounterScreen'),
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
          children: <Widget>[
            const Text(
              'Click Counter',
              style: fontSize30,
            ),
            Text(
              //Casteo de int a string
              '$contador',
              style: fontSize30,
            ),
          ],
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      /*
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_circle_outline,
        ),
        onPressed: () {
          //Debido a que es un stalessWidget hay que utilizar un gestor de estados (StatefulWidget)
          //contador++;
          setState(() {
            //funciona con la suma dentro y fuera
            contador++;
          });
        },
      ),
      */
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          //Mandamos la referencia de la funcion que cambia de estado
          CustomFloatingActions(
        incrementarFn: incrementar,
        decrementarFn: decrementar,
        resetearFn: resetear,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function incrementarFn;
  final Function decrementarFn;
  final Function resetearFn;

  const CustomFloatingActions({
    super.key,
    required this.incrementarFn,
    required this.decrementarFn,
    required this.resetearFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      FloatingActionButton(
        child: const Icon(
          Icons.add_circle_outline,
        ),
        //recoge la funciona de incrementar y la ejecuta aqui
        onPressed: () => incrementarFn(),
      ),
      FloatingActionButton(
        child: const Icon(
          Icons.sync,
        ),
        onPressed: () => resetearFn(),
      ),
      FloatingActionButton(
        child: const Icon(
          Icons.remove_circle_outline,
        ),
        onPressed: () => decrementarFn(),
      ),
    ]);
  }
}
