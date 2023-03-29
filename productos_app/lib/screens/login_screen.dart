import 'package:flutter/material.dart';

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
                const _LoginForm(),
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

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //TODO:Mantener la refrencia a la key
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
              hintText: 'papa.tata@gmail.com',
              labelText: 'Correo Electronico',
              labelStyle: TextStyle(color: Colors.grey),
              prefixIcon:
                  Icon(Icons.alternate_email_sharp, color: Colors.deepPurple),
            ),
          ),
        ]),
      ),
    );
  }
}
