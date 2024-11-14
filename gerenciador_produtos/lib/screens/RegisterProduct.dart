import 'package:flutter/material.dart';
import 'package:projeto_android/components/InputsTextField/InputName.dart';
import 'package:projeto_android/components/Buttons/ButtonRegister.dart';
import 'package:projeto_android/components/InputsTextField/InputPrice.dart';
import 'package:projeto_android/components/InputsTextField/InputQtd.dart';

class Registerproduct extends StatefulWidget {
  const Registerproduct({super.key});

  @override
  State<Registerproduct> createState() => _RegisterproductState();
}

class _RegisterproductState extends State<Registerproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('cadastrar produto'),
        ),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: InputName(),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InputPrice(),
                InputQtd(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: ButtonRegister(),
            ),
          ],
        ),
      ),
    );
  }
}
