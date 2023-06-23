import 'package:flutter/material.dart';
import 'package:myshop/color_theme/color_theme.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryColorBg,
        title: Text(
          title,
          style: TextStyle(color: ColorTheme.primaryColorFontOnBg),
        ),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
