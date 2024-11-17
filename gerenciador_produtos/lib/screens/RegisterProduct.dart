import 'package:flutter/material.dart';
import 'package:projeto_android/components/InputsTextField/InputName.dart';
import 'package:projeto_android/components/Buttons/ButtonRegister.dart';
import 'package:projeto_android/components/InputsTextField/InputPrice.dart';
import 'package:projeto_android/components/InputsTextField/InputQtd.dart';
import 'package:projeto_android/components/messages/TopSnackBar.dart';

class Registerproduct extends StatefulWidget {
  const Registerproduct({super.key});

  @override
  State<Registerproduct> createState() => _RegisterproductState();
}

class _RegisterproductState extends State<Registerproduct> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _qtdController = TextEditingController();

  String? messageErrorInputText;
  String? messageErrorInputPrice;
  String? messageErrorInputQtd;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      _clearErrorMessage(messageErrorInputText);
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
    if (_textController.text.isEmpty) {
      setState(() {
        messageErrorInputText = 'campo obrigatório.';
      });
    } else if (_priceController.text.isEmpty) {
      setState(() {
        messageErrorInputPrice = 'campo obrigatório.';
      });
    } else if (_qtdController.text.isEmpty) {
      setState(() {
        messageErrorInputQtd = 'campo obrigatório.';
      });
    } else {
      showTopSnackBar(context, "Produto cadastrado com sucesso!");
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
