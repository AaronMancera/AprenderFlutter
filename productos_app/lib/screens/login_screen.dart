import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //El tamaño de la pantalla
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: AuthBackground(
          child: Column(children: [
            //el espacio entre la caja y la parte de arriba
            SizedBox(
              height: size.height * 0.2,
            ),
            //el contenedor de la card
            CardContainer(
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Login',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 30),
                //Esto pondra al provider como observador y notificar de los cambios en la aplicacion
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: const _LoginForm(), //-> Formulario de login
                ),
                const SizedBox(height: 50),
                const Text(
                  'Crear una nueva cuenta',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

//Formulario del login
class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //recoge la key del formulario
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //TODO:Mantener la refrencia a la key
        key:loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        //Email
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecorations(
                hintText: 'papa.tata@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: const Icon(Icons.alternate_email_sharp,
                    color: Colors.deepPurple)),
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Correo escrito de manera incorrecto';
            },
            onChanged: (value) => loginForm.email=value,
          ),
          const SizedBox(
            height: 30,
          ),
          //Contraseña
          TextFormField(
            autocorrect: false,
            obscureText: true, //oculta las letras en *
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecorations(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: const Icon(Icons.local_activity_outlined)),
            validator: (value) {
              if (value != null && value.length >= 6 && value.length <= 10) {
                return null;
              } else {
                return 'Entre 6 y 10 caracteres';
              }
            },
            onChanged: (value) => loginForm.password=value,
          ),
          const SizedBox(
            height: 30,
          ),
          //Boton
          MaterialButton(
            onPressed: () {
              //TODO: Login form
              loginForm.isValidForm();
              if( !loginForm.isValidForm() ){
                return;
              }
              Navigator.pushReplacementNamed(context, '/home');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.deepPurple,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text(
                'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
