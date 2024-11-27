import 'package:flutter/material.dart';
import 'package:projeto_android/components/Lists/ListsProducts.dart';
import 'package:projeto_android/screens/EditProduct.dart';
import 'package:projeto_android/services/ProductService.dart';

class Listproduct extends StatefulWidget {
  const Listproduct(
      {super.key,
      required this.products,
      required this.onEditProduct,
      required this.onDeleteProduct});

  final List<Map<String, dynamic>> products;
  final Function onEditProduct;
  final Function onDeleteProduct;

  @override
  State<Listproduct> createState() => _ListproductState();
}

class _ListproductState extends State<Listproduct> {
  final ProductService productService = ProductService();

  _onDeleteItem(int index) {
    setState(() {
      widget.onDeleteProduct(index);
    });
  }

  void _onEditItem(int index, Map<String, dynamic> updatedValues) {
    setState(() {
      widget.onEditProduct(index, updatedValues);
    });
  }

  _openEditScreen(BuildContext context, int index) {
    final itemToEdit = widget.products[index];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProduct(
          product: itemToEdit,
          onEditProduct: _onEditItem,
          index: index,
        ),
      ),
    );
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
            mainList: widget.products,
            deleteItem: _onDeleteItem,
            editItem: _openEditScreen,
          ),
        ],
      ),
    );
  }
}
