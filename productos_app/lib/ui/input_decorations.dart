import 'package:flutter/material.dart';

class InputDecorations {
  //Para hacer que este metodo sea funcional para todos los casos se pasan por parametro los valores
  static InputDecoration authInputDecorations({
    required String hintText,
    required String labelText,
    Icon? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon);
  }
}
