import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Container(
        alignment: Alignment.center,
        child: const Text(
          'PRIMEIRO APP',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Column _buildBody() {
    return const Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text('HELO WORLD!', style: TextStyle(fontSize: 16)),
        ),
        Align(
            alignment: Alignment.center,
            child: Text('olá mundo!', style: TextStyle(fontSize: 15)))
      ],
    );
  }
}
