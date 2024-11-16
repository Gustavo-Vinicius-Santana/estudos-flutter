import 'package:flutter/material.dart';

class InputName extends StatefulWidget {
  const InputName({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateCharCounter);
  }

  void _updateCharCounter() {
    setState(() {
      _charCount = widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharCounter); // Remove o listener
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: widget.controller,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: 'NOME',
          hintText: 'Digite um nome',
          hintStyle: const TextStyle(color: Colors.grey),
          counterText: '$_charCount/20',
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
      ),
    );
  }
}