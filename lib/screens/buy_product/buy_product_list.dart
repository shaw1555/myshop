import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/model/product.dart';

class BuyProductList extends StatefulWidget {
  const BuyProductList({super.key, required this.lstProduct});
  final List<Product> lstProduct;

  @override
  State<BuyProductList> createState() => _BuyProductListState();
}

class _BuyProductListState extends State<BuyProductList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          (3 /
              5), // Set the height based on the desired ratio (3/5 in this example)
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingTextStyle: TextStyle(color: ColorTheme.primaryColorBg),
            columns: const [
              DataColumn(label: Text('Product Name')),
              DataColumn(
                label: Text('Qty'),
                numeric: true,
              ),
              DataColumn(
                label: Text('Item Total'),
                numeric: true, // Set numeric to true for right alignment
              ),
            ],
            rows: widget.lstProduct.map((product) {
              return DataRow(cells: [
                DataCell(Text(product.productName)),
                DataCell(Text(product.orderQty.toString())),
                DataCell(Text(
                  NumberFormat.decimalPattern()
                      .format(product.orderQty * product.price),
                )),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
