import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const [Icon(Icons.call), Text('Call')],
          ),
          Column(
            children: const [Icon(Icons.route), Text('Route')],
          ),
          Column(
            children: const [Icon(Icons.share), Text('Share')],
          )
        ],
      ),
    );
  }
}
