import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/model/product.dart';
import 'package:myshop/widgets/buttonOrderQty.dart';

class Item extends StatelessWidget {
  final Product product;

  const Item({Key? key, required this.product}) : super(key: key);

  void orderQtyEvent(bool addQty) {
    print('h1');
    print(addQty);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          product.photo, //Image.asset('assets/images/sale.png'),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productName,
                    style: TextStyle(color: ColorTheme.primaryColorBg),
                  ),
                  Text(NumberFormat.decimalPattern().format(product.price))
                ],
              ),
              Expanded(
                child: Container(),
              ),
              ButtonOrderQty(
                textName: '+',
                myEvent: (value) => orderQtyEvent(value),
                value: true,
              ),
              const SizedBox(width: 8.0),
              Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorTheme.secondaryColorBg,
                ),
                child: Center(
                  child: Text(
                    product.orderQty.toString(),
                    style: TextStyle(
                      color: ColorTheme.primaryColorFontOnBg,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              ButtonOrderQty(
                textName: '-',
                myEvent: (value) => orderQtyEvent(value),
                value: false,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
