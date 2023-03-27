import 'package:diseno/widgets/widgets.dart';
import 'package:flutter/material.dart';


class BasicDseingScreen extends StatelessWidget {
  const BasicDseingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          //Imagen
          Image(image: AssetImage('landScape.jpg')),
          //Titulo
          CustomTitle(),
          CustomIcon(),
          CustomText(),
        ],
      ),
    );
  }
}
