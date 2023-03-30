import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              //TODO: Insertar todos los campos de los productos
              //Parte de arriba de imagen y boton de retoceso
              children: [
                const ProductImage(),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white, size: 40),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            //Formulario del propio producto
            const _ProductForm(),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

// Formulario debajo de la imagen
class _ProductForm extends StatelessWidget {
  const _ProductForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        //Padding para los inputs
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
              child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecorations.authInputDecorations(
                    hintText: 'Nombre del producto', labelText: 'Nombre'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecorations(
                    hintText: '150€', labelText: 'Precio'),
              ),
              const SizedBox(
                height: 30,
              ),
              SwitchListTile(
                value: true,
                onChanged: (value) {
                  //TODO: Pendiente
                },
                title: const Text('Disponible'),
                activeColor: Colors.indigo,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            )
          ]);
}
