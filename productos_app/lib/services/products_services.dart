//Converter json
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
//import para utilizar los metodos get, post etc
import 'package:http/http.dart' as http;

class ProductsServices extends ChangeNotifier {
  final String _baseUrl =
      'flutter-varios-7c5c3-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Product> products = [];
  //TODO: Hacer fetch de productos
  bool isLoading = true;
  ProductsServices() {
    //Llama al metodo que realiza la peticion
    loadProducts();
  }
  //TODO: <List<Product>> Carga los productos de la base de datos y los devuelve
  Future loadProducts() async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    // print(productsMap);
    //Importante tener bien los parametros en firebase y en el modelo bien
    productsMap.forEach((key, value) { 
      // print(value);
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);

    });
     print(products[0].name);
  }
}
