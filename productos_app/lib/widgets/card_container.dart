import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30), // Añade un padding a todo el contenido de nuestro child
        // height: 300, -> Sin esto se queda todo pegado  
        decoration: _createCardShape(),
        //el widget que va a tener los espacios de texto para escribir
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(10, 0),
              blurRadius: 15,
            )
          ]);
}
