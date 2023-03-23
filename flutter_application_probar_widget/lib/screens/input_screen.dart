import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/widgets/widgets.dart'
    show CustomInputField;

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Para comunicar el mapa con el formulario utilizamos las keys
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    //informacion en string que vamos a abstraer del formulario
    final Map<String, String> formValues = {
      'first_name': '',
      'last_name': '',
      'email': '',
      'password': '',
      'role':'',
    };

    return Scaffold(
        appBar: AppBar(
          title: const Text('Input y Forms'),
        ),
        //este widget es por si sale el teclado digital que no tape el contenido
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //Formulario
            child: Form(
              //esto guarda todo el estado en la key del form
              key: myFormKey,
              child: Column(children: [
                //puedes poner validaciones automaticas
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre del usuario',
                  helperText: 'Minimo 3 letras',
                  //conexion entre la clase con el formulario actual
                  //propiedad
                  formProperty: 'first_name',
                  //mapa de almacenamiento
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  helperText: 'Minimo 3 letras',
                  formProperty: 'last_name',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  helperText: 'Minimo 3 letras',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del usuario',
                  helperText: 'Minimo 3 letras',
                  obscureText: true,
                  formProperty: 'password',
                  formValues: formValues,
                ),
                const SizedBox(
                  height: 30,
                ),
                //
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(
                      value: 'Admin',
                      child: Text('Admin'),
                    ),
                    DropdownMenuItem(
                      value: 'Superuser',
                      child: Text('Superuser'),
                    ),
                    DropdownMenuItem(
                      value: 'Developer',
                      child: Text('Developer'),
                    ),
                    DropdownMenuItem(
                      value: 'Jr. Developer',
                      child: Text('Jr. Developer'),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role']=value ?? 'Admin';
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      //Cuando toque el boton baja el teclado
                      FocusScope.of(context).requestFocus(FocusNode());
                      //regresa el valor booleano de la validacion
                      if (!myFormKey.currentState!.validate()) {
                        print('Formulario no valido');
                        return;
                      }
                      // Todo: imprimir valores del formulario
                      // Aqui es donde se guardaria lso valores a una backend
                      print(formValues);
                    },
                    child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Guardar'))))
              ]),
            ),
          ),
        ));
  }
}
