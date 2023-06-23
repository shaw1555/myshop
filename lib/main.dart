import 'package:flutter/material.dart';
import 'package:myshop/color_theme/color_theme.dart';
import 'package:myshop/drawer/my_drawer.dart';
import 'package:myshop/home/my_home_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Fix constructor declaration

  final String title = "MyShop";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorTheme.primaryColorBg),
        useMaterial3: true,
      ),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ColorTheme colorTheme = ColorTheme();

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
      drawer: const MyDrawer(),
      body: const MyHomeContent(),
    );
  }
}
