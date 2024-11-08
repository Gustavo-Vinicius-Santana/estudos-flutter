import 'package:flutter/material.dart';
import 'package:projeto_android/screens/matScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('CALCULADORA'),
          ),
        ),
        body: Matscreen(),
      ),
    );
  }
}
