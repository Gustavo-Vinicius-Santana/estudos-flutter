import 'package:flutter/material.dart';

class InputDesc extends StatefulWidget {
  const InputDesc({super.key, required this.controller, this.errorMessage});
  final TextEditingController controller;
  final String? errorMessage;

  @override
  State<InputDesc> createState() => _InputDescState();
}

class _InputDescState extends State<InputDesc> {
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _charCount = widget.controller.text.length;
    widget.controller.addListener(_updateCharCounter);
  }

  void _updateCharCounter() {
    setState(() {
      _charCount = widget.controller.text.length;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharCounter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        maxLines: null,
        controller: widget.controller,
        maxLength: 200,
        decoration: InputDecoration(
          labelText: 'DESCRIÇÃO',
          hintText: 'Digite uma descrição',
          error: widget.errorMessage != null
              ? Text(
                  widget.errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          counterText: '$_charCount/200',
          hintStyle: const TextStyle(color: Colors.grey),
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
        ),
      ),
    );
  }
}
