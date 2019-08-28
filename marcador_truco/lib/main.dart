import 'package:flutter/material.dart';
import 'package:marcador_truco/views/home_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.deepOrange),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
