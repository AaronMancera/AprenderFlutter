import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listview Tipo 1"),
        ),
        body: ListView(
          //Se genera en runtime = no es const
          children: [
            //operador spreed recorre toda la lista
            ...options
                .map(
                  (game) => ListTile(
                    title: Text(game),
                    trailing: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                )
                .toList(),

            // ListTile(
            //   title: Text('HolaMundo'),
            // ),
          ],
        ));
  }
}
