// lib/main.dart

import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Arte',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(), // Define HomePage como a tela inicial
      debugShowCheckedModeBanner: false,
    );
  }
}
