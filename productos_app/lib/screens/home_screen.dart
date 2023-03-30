import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ProductsServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/product'),
          child: const ProductCard(),
        ),
        itemCount: 10,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
