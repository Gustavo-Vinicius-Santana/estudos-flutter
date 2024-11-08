import 'package:flutter/material.dart';

class ButtonForm extends StatefulWidget {
  final VoidCallback onPressed;
  final String nameButton;
  const ButtonForm(
      {super.key, required this.onPressed, required this.nameButton});

  @override
  State<ButtonForm> createState() => _ButtonFormState();
}

class _ButtonFormState extends State<ButtonForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.only(right: 20, left: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Text(
            widget.nameButton,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 1,
          width: 1,
        )
      ],
    );
  }
}
