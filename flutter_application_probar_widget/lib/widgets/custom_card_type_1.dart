import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const ListTile(
          leading: Icon(
            Icons.photo_album,
            color: AppTheme.primaryColor,
          ),
          title: Text('Soy un titulo'),
          subtitle: Text(
              'Amet est tempor id quis. Ea fugiat reprehenderit minim ad adipisicing. Consequat amet labore aliqua elit Lorem sint aliqua ullamco do incididunt cillum laboris. Deserunt mollit consequat sint veniam aute.'),
        ),
        //Padding para que los botones no este pegados a la derecha
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
              TextButton(onPressed: () {}, child: const Text('Ok'))
            ],
          ),
        )
      ]),
    );
  }
}
