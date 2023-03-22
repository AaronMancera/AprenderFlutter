import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: AppTheme.primaryColor.withOpacity(0.5),
      elevation: 50,
      child: Column(children: [
        const FadeInImage(
          //el placeholder es lo que va a estar como en espera hasta mostrar la imagen
          placeholder: AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(
              'https://i.pinimg.com/564x/ab/bd/58/abbd5898c2b3e3279c0dffad61c80e2a.jpg'),
          width: double.infinity,
          height: 230,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 300),
        ),
        Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: const Text("Bocchi the rock!")),
      ]),
    );
  }
}
