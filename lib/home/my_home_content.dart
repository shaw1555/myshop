import 'dart:html';

import 'package:flutter/material.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/model/product.dart';
import 'package:myshop/screens/buy_product/buy_product.dart';
import 'package:myshop/services/product_service.dart';
import 'package:myshop/widgets/item.dart';
import 'package:provider/provider.dart';

class MyHomeContent extends StatefulWidget {
  const MyHomeContent({super.key});

  @override
  State<MyHomeContent> createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  late List<Product> lstProduct;
  late ProductService productService;
  late int totalOrderQty;
  final lblBuy = 'Buy';
  final lblTitle = 'Product List';
  final lblTotalQty = 'T.Qty';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    productService = Provider.of<ProductService>(context);
    lstProduct = productService.getProductList();
    totalOrderQty = lstProduct.fold(
        0, (previousValue, product) => previousValue + (product.orderQty));
  }

  goToBuyProductPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const BuyProduct(title: 'Buy Product')),
    );
  }

  validateOrderForQty() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Info'),
          content: const Text('Please add qty for ordering.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                lblTitle,
                style:
                    TextStyle(fontSize: 24, color: ColorTheme.primaryColorBg),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                lblTotalQty,
                style:
                    TextStyle(fontSize: 16, color: ColorTheme.primaryColorBg),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorTheme.secondaryColorBg,
                ),
                child: Center(
                  child: Text(
                    totalOrderQty.toString(),
                    style: TextStyle(
                      color: ColorTheme.primaryColorFontOnBg,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_basket_outlined,
                        color: ColorTheme.secondaryColorBg),
                    onPressed: () {
                      if (totalOrderQty > 0) {
                        goToBuyProductPage();
                      } else {
                        validateOrderForQty();
                      }
                    },
                  ),
                  Text(
                    lblBuy,
                    style: TextStyle(color: ColorTheme.primaryColorBg),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: lstProduct.length,
            itemBuilder: (BuildContext context, int index) {
              final itm = lstProduct[index];
              return Item(product: itm);
            },
          ),
        ),
      ],
    );
  }
}
