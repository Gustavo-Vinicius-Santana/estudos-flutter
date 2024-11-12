import 'package:flutter/material.dart';

class Listproduct extends StatefulWidget {
  const Listproduct({super.key});

  @override
  State<Listproduct> createState() => _ListproductState();
}

class _ListproductState extends State<Listproduct> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('LISTA DE PRODUTOS'),
      ],
    );
  }
}
