
import 'package:flutter/material.dart';

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