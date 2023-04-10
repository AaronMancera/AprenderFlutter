import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  const ProductImage({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: url == null
              ? const FadeInImage(
                  placeholder: AssetImage('images/jar-loading.gif'),
                  image: AssetImage('images/no-image.png'),
                  //Rellena todo el hueco aunque sea la imagen de menor resolucion
                  fit: BoxFit.cover,
                )
              : FadeInImage(
                  placeholder: const AssetImage('images/jar-loading.gif'),
                  image: NetworkImage(url!),
                  //Rellena todo el hueco aunque sea la imagen de menor resolucion
                  
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      );
}
