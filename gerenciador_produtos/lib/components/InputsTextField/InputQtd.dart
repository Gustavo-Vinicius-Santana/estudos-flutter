import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputQtd extends StatefulWidget {
  const InputQtd({super.key});

  @override
  State<InputQtd> createState() => _InputQtdState();
}

class _InputQtdState extends State<InputQtd> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'QUANTIDADE',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
          contentPadding: const EdgeInsets.only(bottom: 8),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
        ],
      ),
    );
  }
}
