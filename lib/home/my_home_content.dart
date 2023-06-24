import 'package:flutter/material.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/model/product.dart';
import 'package:myshop/services/product_service.dart';
import 'package:myshop/widgets/item.dart';

class MyHomeContent extends StatefulWidget {
  const MyHomeContent({super.key});

  @override
  State<MyHomeContent> createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  late List<Product> lstProduct;
  late ProductService productService;

  @override
  void initState() {
    super.initState();
    productService = ProductService();
    lstProduct = productService.getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Product List',
          style: TextStyle(fontSize: 24, color: ColorTheme.primaryColorBg),
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
