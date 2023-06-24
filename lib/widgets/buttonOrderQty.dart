import 'package:flutter/material.dart';
import 'package:myshop/color_theme/color_theme.dart';

class ButtonOrderQty extends StatelessWidget {
  final String textName;
  final void Function(bool)? myEvent;
  final bool value;

  const ButtonOrderQty(
      {Key? key, required this.textName, required this.myEvent,required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => myEvent?.call(value), // Call the myEvent function
      child: Text(
        textName,
        style: TextStyle(
          color: ColorTheme.primaryColorBg,
          fontSize: 24.0,
        ),
      ),
    );
  }
}
