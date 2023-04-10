import 'package:flutter/material.dart';
import 'package:productos_app/services/products_services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/product_form_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsServices>(context);
    //Patron changeNotifier
    return ChangeNotifierProvider(
      create: (_) =>
          //Se declara el provder del formulario respecto al provider del servicio de bd
          ProductFormProvider(productService.selectedProduct),
      child: _Products(productService: productService),
    );
    // return _Products(productService: productService);
  }
}

class _Products extends StatelessWidget {
  const _Products({
    super.key,
    required this.productService,
  });

  final ProductsServices productService;

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
                ProductImage(
                  url: productService.selectedProduct.image,
                ),
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
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
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
                initialValue: product.name,
                onChanged: (value) => product.name = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecorations(
                    hintText: 'Nombre del producto', labelText: 'Nombre'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                initialValue: '${product.price}',
                onChanged: (value) {
                  if (double.tryParse(value)==null){
                    product.price=0;
                  } else{
                    product.price=double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecorations(
                    hintText: '150€', labelText: 'Precio'),
              ),
              const SizedBox(
                height: 30,
              ),
              SwitchListTile(
                value: product.available,
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
