import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/model/product.dart';
import 'package:myshop/screens/buy_product/buy_product_list.dart';
import 'package:myshop/services/product_service.dart';

class BuyProduct extends StatefulWidget {
  const BuyProduct({super.key, required this.title});

  final String title;

  @override
  State<BuyProduct> createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  late List<Product> lstProduct;
  late ProductService productService;
  late int totalOrderQty;
  late int totalAmount;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    productService = ProductService(); //Provider.of<ProductService>(context);
    lstProduct = productService.getProductOrderList();
    totalOrderQty = lstProduct.fold(
        0, (previousValue, product) => previousValue + (product.orderQty));
    totalAmount = lstProduct.fold(
        0,
        (previousValue, product) =>
            previousValue + (product.orderQty * product.price));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorTheme.primaryColorBg,
          title: Text(
            widget.title,
            style: TextStyle(color: ColorTheme.primaryColorFontOnBg),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BuyProductList(lstProduct: lstProduct),
              Divider(
                color: ColorTheme.primaryColorBg,
                thickness: 1.0,
                height: 20.0,
              ),
              Row(
                children: [
                  const Text('Total Qty:'),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(NumberFormat.decimalPattern().format(totalOrderQty)),
                ],
              ),
              const SizedBox(
                width: 8.0,
              ),
              Row(
                children: [
                  const Text('Total Amount:'),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(NumberFormat.decimalPattern().format(totalAmount)),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      ColorTheme.primaryColorBg),
                  ),
                  onPressed: (){},
                  child: Text(
                    'Pay',
                    style: TextStyle(color: ColorTheme.primaryColorFontOnBg),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
