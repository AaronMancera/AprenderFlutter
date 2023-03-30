
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Generar un diseño de mostreo una imagen de un ApiRest
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30,bottom: 50),
        width: double.infinity,
        height: 400,
        color: Colors.red,
      ),
    );
  }
}