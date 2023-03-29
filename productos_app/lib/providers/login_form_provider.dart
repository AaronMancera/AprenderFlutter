import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //La modificacion de estos parametros es mediante un set en el onchange de los inputs
  String email = '';
  String password = '';
  //Metodo que simula que esta cargando
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //Esta vinculado con el formulario de login screan que devvolvera true o false depedniedno de las vaidaciones propias incrustadas en el formulario
  bool isValidForm() {
    print(formKey.currentState?.validate());
    print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }
}
