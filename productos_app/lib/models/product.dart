/*
Extraido de https://app.quicktype.io/
El json escrito es: 
      {

      "available": true,

      "image": "Urldelaimeagen",

      "name": "PS5 controller",

      "price": 75.59

      } 

*/

// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.available,
    this.image,
    required this.name,
    required this.price,
  });

  bool available;
  String? image;
  String name;
  double price;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        image: json["image"],
        name: json["name"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "image": image,
        "name": name,
        "price": price,
      };
}
