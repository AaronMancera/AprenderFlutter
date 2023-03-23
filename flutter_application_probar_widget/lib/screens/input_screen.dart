import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input y Forms'),
        ),
        //este widget es por si sale el teclado digital que no tape el contenido
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: [
              //puedes poner validaciones automaticas
              TextFormField(
                //salga seleccionado del tiron
                autofocus: true,
                initialValue: '',
                //para poner nombres con mnayuscula la primera
                textCapitalization: TextCapitalization.words,
                //caputurar lo que se escribe
                onChanged: (value) {
                  print('$value');
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
                decoration: const InputDecoration(
                    hintText: 'Nombre del usuario',
                    labelText: 'Nombre',
                    helperText: 'Solo letras',
                    counterText: '3 caracteres',
                    suffixIcon: Icon(Icons.group_add_outlined),
                    // prefix: Icon(Icons.verified_user_outlined),
                    // icon: Icon(Icons.admin_panel_settings),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      )
                    )
                    ),
                  
              )
            ]),
          ),
        ));
  }
}
