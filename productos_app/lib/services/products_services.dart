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
  //este atributo lo vamos a definir cuando pulsemos un producto
  late Product selectedProduct;
  //Hacer fetch de productos
  bool isLoading = true;
  ProductsServices() {
    //Llama al metodo que realiza la peticion
    loadProducts();
  }
  //Carga los productos de la base de datos y los devuelve
  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    //Importante tener bien los parametros en firebase y en el modelo bien
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }
}
