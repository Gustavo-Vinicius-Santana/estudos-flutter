import 'package:flutter/material.dart';

class EditProduct extends StatelessWidget {
  const EditProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Produto'),
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text(
          'Tela de edição',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
