import 'package:diseno/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          //Background
          Background(),
          //Body
          _HomeBody(),
        ],
      ),
        bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: const [
        //Titulos
        PageTitle(),
        //Card Table
        CardTable(),
      ]),
    );
  }
}
