import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          labelText: 'NOME',
          hintText: 'Digite um nome',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
