import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar'), actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CircleAvatar(
            child: const Text('LF'),
            backgroundColor: Colors.teal[900],
          ),
        )
      ]),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 120,
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/17/1a/a4/171aa45ef7e96c3ca440e223f9e8bf2b.jpg'),
        ),
      ),
    );
  }
}
