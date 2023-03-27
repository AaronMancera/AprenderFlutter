import 'package:diseno/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScrollDesingScreen extends StatelessWidget {
  const ScrollDesingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Bakvground imagen
        children: const [
          CustomBackground(),
          MainContent(),
        ],
      ),
    );
  }
}



