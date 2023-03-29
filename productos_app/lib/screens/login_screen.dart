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
            const CardContainer(),
          ]),
        ),
      ),
    );
  }
}
