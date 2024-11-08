import 'package:flutter/material.dart';
import 'dart:math';
import 'package:projeto_android/components/InputNumber.dart';
import 'package:projeto_android/components/ButtonForm.dart';

class Matscreen extends StatefulWidget {
  const Matscreen({super.key});

  @override
  State<Matscreen> createState() => _MatscreenState();
}

class _MatscreenState extends State<Matscreen> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  double _result = 0.0;

  void _caculateSum() {
    final double firstNumber =
        double.tryParse(_firstNumberController.text) ?? 0;
    final double secondNumber =
        double.tryParse(_secondNumberController.text) ?? 0;

    setState(() {
      _result = firstNumber + secondNumber;
    });
  }

  void _calculateSub() {
    final double firstNumber =
        double.tryParse(_firstNumberController.text) ?? 0;
    final double secondNumber =
        double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = firstNumber - secondNumber;
    });
  }

  void _calculateDiv() {
    final double firstNumber =
        double.tryParse(_firstNumberController.text) ?? 0;
    final double secondNumber =
        double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = firstNumber / secondNumber;
    });
  }

  void _calculatePoten() {
    final double firstNumber =
        double.tryParse(_firstNumberController.text) ?? 0;
    final double secondNumber =
        double.tryParse(_secondNumberController.text) ?? 0;
    setState(() {
      _result = pow(firstNumber, secondNumber).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InputNumber(controller: _firstNumberController),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InputNumber(controller: _secondNumberController),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                '$_result',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Primeira linha de botões
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonForm(
                      onPressed: _calculateSub,
                      nameButton: 'Subtração',
                    ),
                    const SizedBox(height: 10),
                    ButtonForm(
                      onPressed: _caculateSum,
                      nameButton: 'Soma',
                    ),
                  ],
                ),
                // Segunda linha de botões
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonForm(
                      onPressed: _calculatePoten,
                      nameButton: 'Potência',
                    ),
                    const SizedBox(height: 10),
                    ButtonForm(
                      onPressed: _calculateDiv,
                      nameButton: 'Divisão',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
