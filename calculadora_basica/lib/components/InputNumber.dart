import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNumber extends StatefulWidget {
  final TextEditingController controller;
  const InputNumber({super.key, required this.controller});

  @override
  State<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          labelText: 'Digite um numero',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*[.]?[0-9]*$')),
        ],
      ),
    );
  }
}
