import 'package:flutter/material.dart';
import 'package:projeto_android/components/Buttons/ButtonRegister.dart';
import 'package:projeto_android/components/InputsTextField/InputDesc.dart';
import 'package:projeto_android/components/InputsTextField/InputName.dart';
import 'package:projeto_android/components/InputsTextField/InputPrice.dart';
import 'package:projeto_android/components/InputsTextField/InputQtd.dart';
import 'package:projeto_android/components/Messages/TopSnackBar.dart';

class EditProduct extends StatefulWidget {
  const EditProduct(
      {super.key, required this.product, required this.listAllProducts});
  final List listAllProducts;
  final Map<String, dynamic> product;

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _qtdController = TextEditingController();

  String? messageErrorInputText;
  String? messageErrorInputDesc;
  String? messageErrorInputPrice;
  String? messageErrorInputQtd;

  @override
  void initState() {
    super.initState();
    _textController.text = widget.product['nome'] ?? '';
    _descController.text = widget.product['descricao'] ?? '';
    _priceController.text = widget.product['preco']?.toString() ?? '';
    _qtdController.text = widget.product['quantidade']?.toString() ?? '';

    _textController.addListener(() {
      _clearErrorMessage(messageErrorInputText);
    });
    _descController.addListener(() {
      _clearErrorMessage(messageErrorInputDesc);
    });
    _priceController.addListener(() {
      _clearErrorMessage(messageErrorInputPrice);
    });
    _qtdController.addListener(() {
      _clearErrorMessage(messageErrorInputQtd);
    });
  }

  void _clearErrorMessage(String? errorMessage) {
    if (errorMessage != null) {
      setState(() {
        errorMessage = null;
      });
    }

    setState(() {
      if (_textController.text.isNotEmpty) {
        messageErrorInputText = null;
      }
      if (_priceController.text.isNotEmpty) {
        messageErrorInputPrice = null;
      }
      if (_qtdController.text.isNotEmpty) {
        messageErrorInputQtd = null;
      }
      if (_descController.text.isNotEmpty) {
        messageErrorInputDesc = null;
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _priceController.dispose();
    _qtdController.dispose();
    super.dispose();
  }

  void _registerProduct() {
    final text = _textController.text;
    final desc = _descController.text;
    final price = _priceController.text;
    final qtd = _qtdController.text;

    if (text.isEmpty || desc.isEmpty || price.isEmpty || qtd.isEmpty) {
      setState(() {
        messageErrorInputText = text.isEmpty ? 'campo obrigatório.' : null;
        messageErrorInputDesc = desc.isEmpty ? 'campo obrigatório.' : null;
        messageErrorInputPrice = price.isEmpty ? 'campo obrigatório.' : null;
        messageErrorInputQtd = qtd.isEmpty ? 'campo obrigatório.' : null;
      });
    } else {
      showTopSnackBar(context, "Produto cadastrado com sucesso!");
      widget.listAllProducts.add({
        'nome': text,
        'preco': double.parse(price),
        'quantidade': int.parse(qtd),
        'descricao': desc,
      });
      _textController.clear();
      _descController.clear();
      _priceController.clear();
      _qtdController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Editar Produto',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                top: 20,
              ),
              child: InputName(
                  controller: _textController,
                  errorMessage: messageErrorInputText),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              child: InputDesc(
                controller: _descController,
                errorMessage: messageErrorInputDesc,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputPrice(
                  controller: _priceController,
                  errorMessage: messageErrorInputPrice,
                ),
                InputQtd(
                  controller: _qtdController,
                  errorMessage: messageErrorInputQtd,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: ButtonRegister(
                register: _registerProduct,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
