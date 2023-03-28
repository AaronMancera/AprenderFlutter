import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    //Boton de navegacion que se posiciona abajo
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Calendario'),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline_outlined), label: 'Gráfica'),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Usuarios'),
      ],
    );
  }
}
