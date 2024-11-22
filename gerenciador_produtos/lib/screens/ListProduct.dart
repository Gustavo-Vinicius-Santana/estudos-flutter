import 'package:flutter/material.dart';
import 'package:projeto_android/components/Lists/ListsProducts.dart';

class Listproduct extends StatefulWidget {
  const Listproduct({super.key, required this.listAllProducts});
  final List listAllProducts;

  @override
  State<Listproduct> createState() => _ListproductState();
}

class _ListproductState extends State<Listproduct> {
  _onDeleteItem(int index) {
    setState(() {
      widget.listAllProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('Lista de Produtos'),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Listsproducts(
            mainList: widget.listAllProducts,
            deleteItem: _onDeleteItem,
          ),
        ],
      ),
    );
  }
}
