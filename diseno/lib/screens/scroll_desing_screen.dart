import 'package:diseno/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ScrollDesingScreen extends StatelessWidget {
  const ScrollDesingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      //physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: const [Page1(), Page2()],
    ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      //Bakvground imagen
      children: const [
        CustomBackground(),
        MainContent(),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF50c2dd),
      child: Center(
        child: TextButton(
            onPressed: () {},
            //style
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(161, 33, 76, 219),
                shape: const StadiumBorder()),
            //child
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Bienvenido",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            )),
      ),
    );
  }
}
