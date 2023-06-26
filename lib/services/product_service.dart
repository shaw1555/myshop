import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myshop/model/product.dart';

class ProductService with ChangeNotifier {
  static final List<Product> _lstProduct = [];

  List<Product> getProductList() {
    return _lstProduct;
  }

  List<Product> getProductOrderList() {
    return _lstProduct.where((x) => x.orderQty > 0).toList();
  }

  void updateOrderQty(String productId, bool addQty) {
    var product = _lstProduct.firstWhere((x) => x.productId == productId);

    if (addQty) {
      product.orderQty++;
    } else {
      if (product.orderQty > 0) product.orderQty--;
    }

    notifyListeners();
  }

  void generateProduct() {
    var random = Random();

    // Define the range of minimum and maximum values
    var min = 10000;
    var max = 300000;

    for (int i = 1; i < 20; i++) {
      int amt = min + random.nextInt(max - min + 1);
      int length =
          random.nextInt(11) + 5; // Generates a random length between 5 and 15

      String randomText = generateRandomText(length);

      Image img = Image.asset('assets/images/car.jpg');
      if (i % 2 == 0) img = Image.asset('assets/images/ph.jpg');
      if (i % 3 == 0) img = Image.asset('assets/images/pizza.jpg');

      final ctl = Product(
          productId: i.toString(),
          productName: randomText,
          photo: img,
          price: amt);

      _lstProduct.add(ctl);
    }
  }

  String generateRandomText(int length) {
    Random random = Random();

    String characters =
        ' abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String randomText = '';

    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(characters.length);
      randomText += characters[randomIndex];
    }

    return randomText;
  }
}
