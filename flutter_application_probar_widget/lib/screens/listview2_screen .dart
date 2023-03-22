import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const [
    'Megaman',
    'Metal Gear',
    'Super Smash',
    'Final Fantasy'
  ];
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listview Tipo 2"),
          elevation: 0,
          backgroundColor: Colors.teal,
        ),
        body: ListView.separated(
          //cantidad en la lista
          itemCount: options.length,
          //crea los elementos, cada uno de los options
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.teal,
            ),
            onTap: () {
              final game = options[index];
              print(game);
            },
          ),
          //Variables no utilizadas con _
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
