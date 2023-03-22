import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key, required this.imageUrl, this.name});
  //variables
  final String imageUrl;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: AppTheme.primaryColor.withOpacity(0.5),
      elevation: 50,
      child: Column(children: [
        FadeInImage(
          //el placeholder es lo que va a estar como en espera hasta mostrar la imagen - asset definido en: pubspec.yaml
          placeholder: const AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(imageUrl),
          width: double.infinity,
          height: 230,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 300),
        ),
        if (name != null)
          Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(name!)),
      ]),
    );
  }
}
