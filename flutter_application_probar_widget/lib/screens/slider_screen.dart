import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 250;
  bool _sliderEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider & Checks'),
      ),
      //cuando la imagen no sobrepase en la pantalla se permite dezplazar para abajo
      body: Column(
        children: [
          Slider(
            min: 50,
            max: 785,
            activeColor: AppTheme.primaryColor,
            // divisions: 10,
            value: _sliderValue,
            //si el checkbox no esta activado no se puede tocar el slider
            onChanged: _sliderEnable
                ? (value) {
                    //Para que los valores actualice la barra tiene que se statefulwidget
                    _sliderValue = value;
                    setState(() {});
                  }
                : null,
          ),
          //CheckBoxListTitle
          // CheckboxListTile(
          //   title: const Text('Activar Sloder'),
          //   activeColor: AppTheme.primaryColor,
          //   value: _sliderEnable,
          //   // Desactiva el checkbox
          //   // onChanged: null
          //   onChanged: (value) {
          //     _sliderEnable = value ?? true;
          //     setState(() {});
          //   },
          // ),
          SwitchListTile.adaptive(
            title: const Text('Activar Sloder'),
            activeColor: AppTheme.primaryColor,
            value: _sliderEnable,
            // Desactiva el checkbox
            // onChanged: null
            onChanged: (value) {
              _sliderEnable = value;
              setState(() {});
            },
          ),
          //Para ver la lista de paquetes utilizados
          const AboutListTile(),

          //Expanded es el tamaño restante de la columna en la pantalla
          Expanded(
              child: SingleChildScrollView(
                  child: Image(
            image: const NetworkImage(
                'https://static.wikia.nocookie.net/spy-x-family9171/images/9/9c/Loid_Forger_Colored_Full_Body.png/revision/latest?cb=20200714125912'),
            height: _sliderValue,
            fit: BoxFit.contain,
          ))),
          // const SizedBox(height: 50,)
        ],
      ),
    );
  }
}
