//implementacion de todas las rutas del main organizadas en este sitio
import 'package:flutter/material.dart';
import 'package:flutter_application_probar_widget/models/models.dart';
import 'package:flutter_application_probar_widget/screens/screens.dart';

class AppRoutes {
  //Ruta inicial
  static const initialRoute = '/home';
  //Listado de menu - Implementacion de factorizacion de MenuOptions
  static final menuOptions = <MenuOptions> [
    // MenuOptions(route: '/home', icon: Icons.home, name: 'Home Screen', screen: const HomeScreen()),
    MenuOptions(route: '/listview1', icon: Icons.list_alt, name: 'List View1', screen: const Listview1Screen()),
    MenuOptions(route: '/listview2', icon: Icons.list_sharp, name: 'List View2', screen: const Listview2Screen()),
    MenuOptions(route: '/alert', icon: Icons.add_alert_rounded, name: 'Alert', screen: const AlertScreen()),
    MenuOptions(route: '/card', icon: Icons.credit_card, name: 'Cards', screen: const CardScreen()),
    MenuOptions(route: '/avatar', icon: Icons.supervised_user_circle_outlined, name: 'Avatar', screen: const AvatarScreen()),
    MenuOptions(route: '/animacion', icon: Icons.play_arrow, name: 'Animated', screen: const AnimatedScreen()),
    MenuOptions(route: '/input', icon: Icons.format_align_justify, name: 'Input', screen: const InputScreen()),
    MenuOptions(route: '/silder', icon: Icons.photo_size_select_large, name: 'Slider', screen: const SliderScreen()),
    MenuOptions(route: '/listviewbuilder', icon: Icons.view_agenda, name: 'InifniteScrol & Pull to refresh', screen: const ListViewBuilderScreen()),



  ];

  //Mediante el menu options se definen las rutas
  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String,Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'/home':(BuildContext context ) =>  const HomeScreen()});
    //recorre el menu options
    for (final options in menuOptions){
      appRoutes.addAll({options.route : ( BuildContext context ) => options.screen});
    }
    return appRoutes;
  }

  // //Todas las rutas
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   '/home': (context) => const HomeScreen(),
  //   '/listview1': (context) => const Listview1Screen(),
  //   '/listview2': (context) => const Listview2Screen(),
  //   '/alert': (context) => const AlertScreen(),
  //   '/card': (context) => const CardScreen(),
  // };
  //Generador de rutas
  static Route<dynamic> onGenerateRoute( RouteSettings settings) {
    //print(settings);
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
