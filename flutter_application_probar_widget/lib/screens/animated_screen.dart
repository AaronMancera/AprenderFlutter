import 'dart:math' as random;

import 'package:flutter/material.dart';

//Como vamos a crear animaciones vamos a trabajar en statefulwidget para tener los states
class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.teal;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(10);
  void changeShape() {
    _width = random.Random().nextInt(350) + 40;
    _height = random.Random().nextInt(650) + 40;
    _color= Color.fromRGBO(random.Random().nextInt(255), random.Random().nextInt(255),
          random.Random().nextInt(255), 1);
    _borderRadiusGeometry= BorderRadius.circular(random.Random().nextInt(100).toDouble()+10);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutBack,
          width: _width,
          height: _height,
          decoration:
              BoxDecoration(color: _color, borderRadius: _borderRadiusGeometry),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(
          Icons.play_circle,
          size: 50,
        ),
      ),
    );
  }
}
