import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    required this.formProperty,
    required this.formValues,
  });
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  //tipo de teclado
  final TextInputType? keyboardType;
  //modo contraseña
  final bool? obscureText;

  //al formulario que va a apuntar
  final String formProperty;
  //los valores del formulario
  final Map<String, String> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //salga seleccionado del tiron
      autofocus: false,
      initialValue: '',
      //para poner nombres con mnayuscula la primera
      textCapitalization: TextCapitalization.words,
      //tipo de teclado
      keyboardType: keyboardType,
      //pone el modo contraseña
      obscureText: obscureText ?? false,
      //caputurar lo que se escribe
      onChanged: (value) {
        //indica que los valores del formulario que hacen referencia al formulario son values
        formValues[formProperty] = value;
      },
      //validaciones
      validator: (value) {
        if (value == null) {
          return 'Este campo es requerido';
        }
        if (value.length < 3) {
          return 'Minimo de 3 letras';
        }
        return null;
      },
      //activar la validacion para siempre
      // autovalidateMode: AutovalidateMode.always,
      //activar la validacion en cuanto el usuario toque
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        // counterText: '3 caracteres',
        icon: icon == null ? null : Icon(icon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      ),
    );
  }
}
