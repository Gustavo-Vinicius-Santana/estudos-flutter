import 'package:flutter/material.dart';
import 'package:projeto_android/components/InputsTextField/InputName.dart';
import 'package:projeto_android/components/InputsTextField/InputDesc.dart';
import 'package:projeto_android/components/Buttons/ButtonRegister.dart';
import 'package:projeto_android/components/InputsTextField/InputPrice.dart';
import 'package:projeto_android/components/InputsTextField/InputQtd.dart';
import 'package:projeto_android/components/messages/TopSnackBar.dart';

class Registerproduct extends StatefulWidget {
  const Registerproduct({super.key, required this.listAllProducts});
  final List listAllProducts;

  @override
  State<Registerproduct> createState() => _RegisterproductState();
}

class _RegisterproductState extends State<Registerproduct> {
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
        title: const Center(
          child: Text('Cadastrar Produto'),
        ),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
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
