import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  //El display del dialog
  void displayDialog(BuildContext context) {
    //Como estoy con statelesswidget no tengo el contex
    showDialog(
        context: context,
        //hara quue al pulsar fuera del dialogo se cierre
        barrierDismissible: true,
        builder: (contex) {
          return AlertDialog(
            elevation: 5,
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('El contenido de la alerta'),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                ),
              ],
            ),
            actions: [
              //Boton para cerrar
              TextButton(
                onPressed: () => {Navigator.pop(contex)},
                child: const Text('Ok'),
              ),
              TextButton(
                  onPressed: () => {Navigator.pop(contex)},
                  child: const Text('Cancelar')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => displayDialog(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Mostrar alerta',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
