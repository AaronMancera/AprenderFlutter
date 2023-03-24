import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      // color: Colors.red,
      child: ListView.builder(
        itemBuilder: (_, index) => _CastCard(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.green,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/300x400'),
            height: 150,
            width: 150,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          'actor-name',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ]),
    );
  }
}
