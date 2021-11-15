import 'package:flutter/material.dart';
import 'package:leitor_codigo_barras/pages/home.page.dart';
import 'package:leitor_codigo_barras/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro Reader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrymariColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}
