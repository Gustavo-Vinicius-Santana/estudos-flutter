import 'package:flutter/material.dart';

class ButtonAction extends StatefulWidget {
  const ButtonAction(
      {super.key, required this.register, required this.textInButton});
  final register;
  final String? textInButton;

  @override
  State<ButtonAction> createState() => _ButtonActionState();
}

class _ButtonActionState extends State<ButtonAction> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.register,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.black),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        widget.textInButton ?? 'Default Text',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
