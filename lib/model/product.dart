import 'package:flutter/material.dart';

class Product {
  String productId;
  String productName;
  Image photo;
  int price;
  int orderQty;

  Product({
    required this.productId,
    required this.productName,
    required this.photo,
    required this.price,
    this.orderQty = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productName: json['productName'],
      photo: json['photo'],
      price: json['price'],
      orderQty: json['orderQty']
    );
  }
}
