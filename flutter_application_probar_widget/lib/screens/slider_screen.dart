import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      //cuando la imagen no sobrepase en la pantalla se permite dezplazar para abajo
      body: SingleChildScrollView(
        child: Column(
          children: [
            Slider(
              min: 50,
              max: 785,
              activeColor: AppTheme.primaryColor,
              // divisions: 10,
              value: _sliderValue,
              onChanged: (value) {
                //Para que los valores actualice la barra tiene que se statefulwidget
                print(value);
                _sliderValue = value;
                setState(() {});
              },
            ),
            Image(image: NetworkImage('https://static.wikia.nocookie.net/spy-x-family9171/images/9/9c/Loid_Forger_Colored_Full_Body.png/revision/latest?cb=20200714125912'), height:_sliderValue, fit: BoxFit.contain,),
            // const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
