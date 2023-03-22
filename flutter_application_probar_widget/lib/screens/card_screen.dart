import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(imageUrl: 'https://i.pinimg.com/564x/ab/bd/58/abbd5898c2b3e3279c0dffad61c80e2a.jpg',name: 'Bocchi the rock!'),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(imageUrl: 'https://i.pinimg.com/564x/aa/9f/94/aa9f9410deebd6f6d313a62e9b5bd176.jpg',),
            SizedBox(
              height: 10,
            ),
            CustomCardType2(imageUrl: 'https://i.pinimg.com/564x/1a/84/35/1a8435b262f70dc441a52bf15a9c620d.jpg',name: 'Ah!'),
            SizedBox(
              height: 100,
            ),
          ],
        ));
  }
}
