import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText(
      {super.key, required this.controller, this.errorMessageLength});

  final TextEditingController controller;
  final String? errorMessageLength;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateCharCount);
  }

  void _updateCharCount() {
    setState(() {
      _charCount = widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    // Remove o listener ao descartar o widget
    widget.controller.removeListener(_updateCharCount);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        maxLength: 20,
        decoration: InputDecoration(
          labelText: 'NOME',
          hintText: 'Digite um nome',
          counterText: '$_charCount/20',
          errorText: widget.errorMessageLength,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
      ),
    );
  }
}
